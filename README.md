# MeshAgent-Assistant
MeshAgent and MeshCentralAssistant InnoSetup installer

* MeshAgent : https://github.com/Ylianst/MeshAgent
* MeshCentral : https://github.com/Ylianst/MeshCentral
* Website : https://www.meshcommander.com/meshcentral2

## Description
MeshAgent is a wonderfull tool, i love it, but deploying it can be hazardous on Windows managed domains
(because SCCM is heavy and your batch script is crap, plus i hate powershell, i do prefer [WAPT](https://www.wapt.fr) )

This is a simple InnoSetup file to build a silent, no prompt shell for MeshAgent + MeshCentralAssistant running at startup.

Feel free to contribute and enhance this 😉 (please, do it)

## Screenshots

![Alt text](/screenshots/capture_1.png?raw=true "Optional Title")

![Alt text](/screenshots/capture_2.png?raw=true "Optional Title")

## Features

* Installs MeshAgent 64 or 32 bits automatically from OS detection
* Adds MeshAssistant in Mesh Agent install path
* Set MeshAssistant to start automatically at user logon
* Local admin rights are mandatory
* Optional : install MeshCentralRouter
* Optional : create desktop icons

## Usage

 * Clone that repo
 * Install latest InnoSetup from official website : https://jrsoftware.org/isdl.php
 * Download meshagent64.exe and meshagent32.exe from your Mesh server
 * Download latest MeshCentralRouter from official Mesh server : https://info.meshcentral.com/downloads/MeshCentral2/MeshCentralRouter.exe
 * Download latest MeshCentralAssistant.exe from official Mesh server : https://info.meshcentral.com/downloads/MeshCentral2/MeshCentralAssistant.exe
 * Adapt filenames if necessary
 * Build
 * Enjoy !

## Command-line usage

Silent install
```
MeshAgent-Assistant_x64_x32.exe /VERYSILENT
```

## Thanks
* Huuuge thanks to Ylian Saint-Hilaire - [@Ylianst](https://github.com/Ylianst/) for that awesome peace of software ❤
