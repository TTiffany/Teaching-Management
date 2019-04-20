#*** Keywords ***
#suite setup action
#    ${ret}=    add school class   1   1班    60
#    set global variable  ${suitesetclassid}    &{ret}[id]
#
#*** Settings ***
#Library    pylib.SchoolClassLib
#Suite Setup    suite setup action
#Suite Teardown    delete school class   ${suitesetclassid}



*** Settings ***
Library    pylib.SchoolClassLib
Variables   cfg.py

Suite Setup    add school class   ${g_grade_7_id}   1班    60    suite_g7c1_classid
Suite Teardown    delete school class   ${suite_g7c1_classid}
