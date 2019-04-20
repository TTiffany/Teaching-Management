*** Settings ***
Library    pylib.SchoolClassLib
Library    pylib.TeacherLib
Library    pylib.StudentLib

Suite Setup     Run Keywords    delete all students   AND
                ...  delete all teachers   AND
                ...  delete all school classes
