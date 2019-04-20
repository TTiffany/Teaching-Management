*** Settings ***
Library  pylib.WebOpLib
Library  pylib.TeacherLib
Library  pylib.StudentLib

Variables  cfg.py

Suite Setup   open browser
Suite Teardown   close browser


*** Test Cases ***
老师登录1 - tc005001

    ${addRet}=  add teacher    tuobahong   拓跋宏
           ...  ${g_subject_math_id}
           ...  ${suite_g7c1_classid}
           ...  13000000001  1301@g.com  320520001

    should be true  $addRet['retcode']==0


    teacher login   tuobahong   888888

    ${teacherinfo}=  get_teacher_homepage_info
    ${eteacherinfo}=  create list  松勤学院0001   拓跋宏
                  ...  初中数学   0   0   0

    should be equal   ${teacherinfo}    ${eteacherinfo}


    ${classstudent}=  get_teacher_class_students_info
    should be true   $classstudent=={'七年级1班':[]}

    [Teardown]  delete teacher   &{addRet}[id]



*** Test Cases ***
学生登录1 - tc005081
# 添加 学生
    ${addRet}=    add student    xielingyun5   谢灵运   ${g_grade7_id}
           ...    ${suite_g7c1_classid}    13200000001

    should be true     $addRet['retcode']==0

#学生登录

    student login   xielingyun5  888888


    ${astudentinfo}=  get student homepage info
    ${estudentinfo}=   create list   谢灵运  松勤学院0001    0   0
    should be equal    ${astudentinfo}    ${estudentinfo}

    ${wrongquestioninfo}=  get student wrongquestions

    should be equal    ${wrongquestioninfo}   您尚未有错题入库哦


    [Teardown]    delete student   &{addRet}[id]
