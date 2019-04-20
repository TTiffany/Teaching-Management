*** Settings ***
Library    pylib.StudentLib
Variables   cfg.py


*** Test Cases ***
添加学生1 - tc002001
    ${addRet}=   add student   xielingyun   谢灵运
        ...  ${g_grade_7_id}
        ...  ${suite_g7c1_classid}    13200000001

    Should be true   $addRet["retcode"]==0


    ${listRet}=   list student

    studentlist should contain   &{listRet}[retlist]
        ...  xielingyun   谢灵运    &{addRet}[id]
        ...  13200000001    ${suite_g7c1_classid}

    [Teardown]  delete student   &{addRet}[id]

