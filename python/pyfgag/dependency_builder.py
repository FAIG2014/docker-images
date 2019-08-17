#!/usr/bin/python3


"""
run build_deps

Usage:
    build_deps 

"""

import os
import json
from typing import List

def get_workspace_path(json_path):
    workspace_path = json_path.split("/fpga-projects/")[0]
    return workspace_path

def get_source_path(json_path):
    workspace_path = get_workspace_path(json_path)
    source_path = os.path.join(workspace_path, "fpga-projects", "fpga", "sources")
    return source_path

def get_build_path(path):
    workspace_path = get_workspace_path(path)
    build_path = os.path.join(workspace_path, "fpga-projects", "fpga", "builds")
    return build_path



class FpgaLib(object):
    def __init__(self, path: str):
        self.path = path
        json_path = os.path.join(self.path, "files.json")
        self.json_deps = {}
        with open(json_path, "r") as json_file:
            self.json_deps = json.loads(json_file.read())

    @property
    def source_files(self)  -> List[str]:
        return [os.path.join(self.path, s) for s in self.json_deps["source_files"]]

    @property
    def lib_path_dependencies(self) -> List[str]:
        source_path = get_source_path(self.path)
        return [os.path.join(source_path, s) for s in self.json_deps["lib_path_dependencies"]]
    
    @property
    def need_be_included(self) -> bool:
        if "need_be_included" in self.json_deps:
            return bool(self.json_deps["need_be_included"])
        else:
            return False

    def __str__(self):
        return "lib: %s \nlib_deps:%s \nfiles:%s"  % (self.path, self.lib_path_dependencies, self.source_files)

    def get_lib_path_dependencies(self, exclude_libs:List[str]=[]) -> List[str]:
        """will return the """
        return [lib for lib in self.lib_path_dependencies if lib not in exclude_libs]

    def get_full_lib_dependencies(self, exclude_libs:List[str]=[]) -> List[str]:
        """will follow the tree of deps to get all the libs"""
        
        libs_dep = self.get_lib_path_dependencies(exclude_libs=exclude_libs)
        libs_to_check = libs_dep.copy()
        #print("enter new level deps:%s, %s"% (self.path, libs_dep))

        while len(libs_to_check):
            checking = libs_to_check.pop()
            #print("going to check: %s remain:%d curr:%s" % (checking, len(libs_to_check), libs_dep))
            full_deps_this_lib = FpgaLib(checking).get_full_lib_dependencies(libs_dep)
            libs_to_check += full_deps_this_lib
            #print("checked:%s"% full_deps_this_lib)
            libs_dep[:0] = full_deps_this_lib
            #print("checked: done %s"% libs_dep)

        #print("level done :%s" % libs_dep)
        return libs_dep


    def get_full_file_dependencies(self, exclude_file:List[str]=[]) -> List[str]:
        full_lib_dependencies = self.get_full_lib_dependencies()
        files = []
        for lib in full_lib_dependencies:
            
            files.extend(FpgaLib(lib).source_files)
        
        files.extend(self.source_files)
        return files

    def get_full_include_dependencies(self, exclude_lib:List[str]=[]) -> List[str]:
        full_lib_dependencies = self.get_full_lib_dependencies()
        includes = []
        for lib in full_lib_dependencies:
            if FpgaLib(lib).need_be_included:
                includes.append(lib)
        
        return includes

class DependencyBuilder(object):
    def __init__(self, path:str):
        self.path = path
        
        # build the current lib
        curr = FpgaLib(path)
        #print(curr)

        print("libs deps:%s" % curr.get_full_lib_dependencies())
        print("files:%s " % curr.get_full_file_dependencies())
        print("includes:%s " % curr.get_full_include_dependencies())


class MultiDependencyBuilder(object):
    def __init__(self, path0:str, path1:str):
        self.path0 = path0
        self.path1 = path1
       


    def get_full_lib_dependencies(self, exclude_libs:List[str]=[]) -> List[str]:
        return FpgaLib(self.path0).get_full_lib_dependencies()


    def get_full_file_dependencies(self, exclude_file:List[str]=[]) -> List[str]:
        full_lib_dependencies = self.get_full_lib_dependencies()
        files = []
        for lib in full_lib_dependencies:
            files.extend(FpgaLib(lib).source_files)
        
        files.extend(FpgaLib(self.path0).source_files)
        return files

    def get_full_include_dependencies(self, exclude_lib:List[str]=[]) -> List[str]:
        full_lib_dependencies = self.get_full_lib_dependencies()
        includes = []
        for lib in full_lib_dependencies:
            if FpgaLib(lib).need_be_included:
                includes.append(lib)
        
        return includes


if __name__ == '__main__':

    current_path = os.getcwd()
    dep_builder = DependencyBuilder(current_path)




