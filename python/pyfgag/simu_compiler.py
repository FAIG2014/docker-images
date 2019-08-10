
import os
import sys
import pyfgag.dependency_builder as deps
import subprocess
import pathlib


class SimuCompiler(object):
    def __init__(self, build_dir=os.getcwd()):
        self.current_folder = os.getcwd()
        self.build_dir = build_dir
        pathlib.Path(self.build_dir).mkdir(parents=True, exist_ok=True)

    def create_cmds_compile(self, top_level_file_path:str):
        raise NotImplementedError("Subclasses should implement this!")
    
    def create_cmds_run(self, top_level_file_path:str):
        raise NotImplementedError("Subclasses should implement this!")

    def compile(self, top_level_file_path:str):
        cmds = self.create_cmds_compile(top_level_file_path=top_level_file_path)
        
        for cmd in cmds:
            print("RUNING %s" % cmd)
            cmd_ret = subprocess.call(cmd, shell=True, cwd=self.build_dir)
            if cmd_ret:
                print("ERROR: compiles went wrong")
                raise Exception()

    def run_simu(self, top_level_file_path:str):
        cmds = self.create_cmds_run(top_level_file_path=top_level_file_path)
        
        for cmd in cmds:
            cmd_ret = subprocess.call(cmd, shell=True, cwd=self.build_dir)
            if cmd_ret:
                raise Exception()

    @staticmethod
    def get_module_name_from_path(file_path:str):
        # we are assuming that we are logical, and the file name is the module name.
        basename = os.path.basename(file_path)
        return os.path.splitext(basename)[0]
    



class CompilerIverilog(SimuCompiler):
    def __init__(self, build_dir=os.getcwd()):
        super(CompilerIverilog, self).__init__(build_dir=build_dir)

    def create_cmds_compile(self, top_level_file_path:str):
        
        build_lib = deps.FpgaLib(self.current_folder)

        cmd = "iverilog -g2012 "

        # define
        cmd += " -D SIMULATION "

        # includes
        for include in build_lib.get_full_include_dependencies():
            cmd += " -I %s " % include

        # files
        for sv_file in build_lib.get_full_file_dependencies():
            cmd += " %s " % sv_file
        
        cmd += " %s "  % top_level_file_path

        print(cmd)
        return [cmd]
    
    def create_cmds_run(self, top_level_file_path:str):
        cmd = "vvp a.out "
        return [cmd]



class CompilerModelsim(SimuCompiler):
    def __init__(self, build_dir=os.getcwd()):
        super(CompilerModelsim, self).__init__(build_dir=build_dir)

    def create_cmds_compile(self, top_level_file_path:str):
        cmds = []
        build_lib = deps.FpgaLib(self.current_folder)

        cmds.append("which vlib")
        cmds.append("vlib work")
        cmds.append("vmap work work")

        cmd = "vlog "

        # define
        cmd += " +define+SIMULATION "

        # includes
        for include in build_lib.get_full_include_dependencies():
            cmd += " +incdir+%s " % include

        # files
        for sv_file in build_lib.get_full_file_dependencies():
            cmd += " %s " % sv_file
        
        cmd += " %s "  % top_level_file_path

        cmds.append(cmd)
        return cmds
    
    def create_cmds_run(self, top_level_file_path:str):
        # crazy warning we want to remove
        #cmd += " +nowarn3116"
        cmd = "vsim +nowarn3116 -t ps -c -do \"log -r /* ; run 20 ms; quit -f \" %s " % self.get_module_name_from_path(top_level_file_path)
        return [cmd]



class CompilerVerilator(SimuCompiler):
    def __init__(self, build_dir=os.getcwd()):
        super(CompilerVerilator, self).__init__(build_dir=build_dir)
    
    @staticmethod
    def sv_top_name(top_level_file_path:str):
        main_name = CompilerVerilator.get_module_name_from_path(top_level_file_path)

        return main_name.split("_main")[0]
        #return CompilerVerilator.get_module_name_from_path(top_level_file_path)

    def create_cmds_compile(self, top_level_file_path:str):
        cmds = []
        build_lib = deps.FpgaLib(self.current_folder)
        sv_top_name = self.sv_top_name(top_level_file_path)

        cmd = "verilator -Wall --cc %s.sv  -GTEST=2" % sv_top_name

        # define
        cmd += " +define+SIMULATION --dump-defines "

        # includes
        for include in build_lib.get_full_include_dependencies():
            cmd += " +incdir+%s " % include

        # files
        for sv_file in build_lib.get_full_file_dependencies():
            cmd += " %s " % sv_file
        
        cmd += " --exe  %s "  % top_level_file_path

        cmds.append(cmd)

        cmds.append("make -j -C obj_dir -f V%s.mk V%s" % (sv_top_name, sv_top_name) )

        return cmds
    
    def create_cmds_run(self, top_level_file_path:str):
        sv_top_name = self.sv_top_name(top_level_file_path)
        cmd = "obj_dir/V%s" % sv_top_name
        return [cmd]


class CompilerVivado(SimuCompiler):
    def __init__(self,  build_dir=os.getcwd()):
        super(CompilerVivado, self).__init__(build_dir=build_dir)
    

    def create_cmds_compile(self, top_level_file_path:str):
        cmds = []
        build_lib = deps.FpgaLib(self.current_folder)
        sv_top_name = CompilerVivado.get_module_name_from_path(top_level_file_path)

        cmd = "xvlog -sv "

        # define
        cmd += " -d SIMULATION"

        # includes
        for include in build_lib.get_full_include_dependencies():
            cmd += " -i %s " % include

        # files
        for sv_file in build_lib.get_full_file_dependencies():
            cmd += " %s " % sv_file
        
        cmd += " %s "  % top_level_file_path

        cmds.append(cmd)

        cmds.append("xelab -debug typical %s -s %s_sim" % (sv_top_name, sv_top_name) )

        return cmds
    
    def create_cmds_run(self, top_level_file_path:str):
        cmd = ""
        return [cmd]