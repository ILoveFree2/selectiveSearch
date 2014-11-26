#!/bin/bash

python generateMine.py
mkdir ../icdar1003/SceneTrialTest/backup/$1
evalfixed  myResult.xml ../icdar1003/SceneTrialTest/locations.xml > ../icdar1003/SceneTrialTest/backup/$1/result.txt

mkdir ../icdar1003/SceneTrialTest/backup/$1/05
mkdir ../icdar1003/SceneTrialTest/backup/$1/13
mkdir ../icdar1003/SceneTrialTest/backup/$1/small

 mv ../icdar1003/SceneTrialTest/ryoungt_05.08.2002/*.txt ../icdar1003/SceneTrialTest/backup/$1/05/
 mv ../icdar1003/SceneTrialTest/ryoungt_13.08.2002/*.txt ../icdar1003/SceneTrialTest/backup/$1/13/
 mv ../icdar1003/SceneTrialTest/sml_01.08.2002/*.txt ../icdar1003/SceneTrialTest/backup/$1/small/
 mv myResult.xml ../icdar1003/SceneTrialTest/backup/$1/