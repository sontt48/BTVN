***Settings***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    REST
Library    JSONLibrary
Library    TemplatedData
# Resource    ${CURDIR}/../Variables.robot
# Resource    ${CURDIR}/../Keywords.robot
Resource    ${CURDIR}/../Keywords/web/pages/homepage/homepage_desktop.robot
Resource    ${CURDIR}/../Keywords/web/features/homepage/homepage_desktop.robot
Resource    ${CURDIR}/../Keywords/web/features/PDP/PDP_desktop.robot
Resource    ${CURDIR}/../Keywords/web/features/PLP/PLP_desktop.robot
Resource    ${CURDIR}/../Keywords/dataKeywords.robot

Resource    ${CURDIR}/../Keywords/common_keywords.robot


Variables    ${CURDIR}/../test_data.yaml