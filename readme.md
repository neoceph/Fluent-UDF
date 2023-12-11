# Instructions

- Load fluent from the Developer Command Prompt of Microsoft Visual Studio. Only in this way, fluent udf can be compiled.

- Backup makefile_nt.udf under 
> `installationDirectory\v202\fluent\fluent20.2.0\src\udf\makefile_nt.udf`

- Copy and replace the makefile_nt.udf with the one in this directory.

The provided makefile_nt.udf is making only the following two changes

> CFLAGS = /c /Za <span style="color:red">/Zi</span> /DUDF_EXPORTING /DUDF_NT /DWIN64 /EHa /wd4224

>link \$(LIBS) /dll <span style="color:red">/debug /assemblydebug</span> /out:$(TARGET)

Attach to fl_mpi2020.exe

Now introduce a breakpoint and run fluent process. The breakpoint will be hit.

A video instruction is available [here](https://youtu.be/sK7u416BOas)