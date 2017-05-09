*** Settings ***
Library   String
Library   Selenium2Library
Library   Collections
Library   tovprof_service.py

*** Variables ***
${locator.edit.description}                                     id=ePosition_description
${locator.title}                                                id=title
${locator.description}                                          id=description
${locator.minimalStep.amount}                                   id=minimal-step-info
${locator.value.amount}                                         id=value-info
${locator.value.valueAddedTaxIncluded}                          xpath=.//*[@id='tax-info']/span
${locator.value.currency}                                       xpath=.//*[@id='param-auc']/table/tbody/tr[6]/td[1]/span
${locator.auctionPeriod.startDate}                              id=auction-start-info
${locator.auctionPeriod.endDate}                                id=auction-end-info
${locator.enquiryPeriod.startDate}                              id=tendering-start-info
${locator.enquiryPeriod.endDate}                                id=tendering-end-info
${locator.tenderPeriod.startDate}                               id=tendering-start-info
${locator.tenderPeriod.endDate}                                 id=tendering-end-info
${locator.tenderId}                                             id=auctionId-info
${locator.procuringEntity.name}                                 id=organizer-name-info
${locator.dgf}                                                  id=dgf-id-info
${locator.dgfDecisionID}                                        id=dgf-decision-id-info
${locator.dgfDecisionDate}                                      id=dgf-decision-date-info
${locator.eligibilityCriteria}                                  xpath=html/body/div/div/div[1]/div[2]/div[2]/p[5]
${locator.tenderAttempts}                                       id=tender-attempts-info
${locator.procurementMethodType}                                id=type-info
${locator.items[0].quantity}                                    xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[2]/span[1]
${locator.items[0].description}                                 xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[1]/span[1]
${locator.items[0].unit.code}                                   xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[2]/span[3]
${locator.items[0].unit.name}                                   xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[2]/span[2]
${locator.items[0].deliveryAddress.postalCode}                  xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[3]/span[2]
${locator.items[0].deliveryAddress.countryName}                 xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[3]/span[1]
${locator.items[0].deliveryAddress.region}                      xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[3]/span[3]
${locator.items[0].deliveryAddress.locality}                    xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[3]/span[4]
${locator.items[0].deliveryAddress.streetAddress}               xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[3]/span[5]
${locator.items[0].classification.scheme}                       xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[1]/span[2]
${locator.items[0].classification.id}                           xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[1]/span[3]
${locator.items[0].classification.description}                  xpath=.//*[@id='param-items']/table/tbody/tr[1]/td[1]/span[4]
${locator.items[1].description}                                 xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[1]/span[1]
${locator.items[1].classification.id}                           xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[1]/span[3]
${locator.items[1].classification.description}                  xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[1]/span[4]
${locator.items[1].classification.scheme}                       xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[1]/span[2]
${locator.items[1].unit.code}                                   xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[2]/span[3]
${locator.items[1].unit.name}                                   xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[2]/span[2]
${locator.items[1].quantity}                                    xpath=.//*[@id='param-items']/table/tbody/tr[2]/td[2]/span[1]
${locator.items[2].description}                                 xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[1]/span[1]
${locator.items[2].classification.id}                           xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[1]/span[3]
${locator.items[2].classification.description}                  xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[1]/span[4]
${locator.items[2].classification.scheme}                       xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[1]/span[2]
${locator.items[2].unit.code}                                   xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[2]/span[3]
${locator.items[2].unit.name}                                   xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[2]/span[2]
${locator.items[2].quantity}                                    xpath=.//*[@id='param-items']/table/tbody/tr[3]/td[2]/span[1]
${locator.questions[0].title}                                   xpath=.//*[@id='auc-questions']/table/tbody/tr[1]/td[1]/span[1]
${locator.questions[0].description}                             xpath=.//*[@id='auc-questions']/table/tbody/tr[1]/td[2]
${locator.questions[0].date}                                    xpath=.//*[@id='auc-questions']/table/tbody/tr[1]/td[1]/span[2]
${locator.questions[0].answer}                                  xpath=.//*[@id='auc-questions']/table/tbody/tr[1]/td[3]
${locator.questions[1].title}                                   xpath=.//*[@id='auc-questions']/table/tbody/tr[2]/td[1]/span[1]
${locator.questions[1].description}                             xpath=.//*[@id='auc-questions']/table/tbody/tr[2]/td[2]
${locator.questions[1].date}                                    xpath=.//*[@id='auc-questions']/table/tbody/tr[2]/td[1]/span[2]
${locator.questions[1].answer}                                  xpath=.//*[@id='auc-questions']/table/tbody/tr[2]/td[3]
${locator.questions[2].title}                                   xpath=.//*[@id='auc-questions']/table/tbody/tr[3]/td[1]/span[1]
${locator.questions[2].description}                             xpath=.//*[@id='auc-questions']/table/tbody/tr[3]/td[2]
${locator.questions[2].date}                                    xpath=.//*[@id='auc-questions']/table/tbody/tr[3]/td[1]/span[2]
${locator.questions[2].answer}                                  xpath=.//*[@id='auc-questions']/table/tbody/tr[3]/td[2]
${locator.questions[3].title}                                   xpath=.//*[@id='auc-questions']/table/tbody/tr[4]/td[1]/span[1]
${locator.questions[3].description}                             xpath=.//*[@id='auc-questions']/table/tbody/tr[4]/td[2]
${locator.questions[3].date}                                    xpath=.//*[@id='auc-questions']/table/tbody/tr[4]/td[1]/span[2]
${locator.questions[3].answer}                                  xpath=.//*[@id='auc-questions']/table/tbody/tr[4]/td[3]
${locator.questions[4].title}                                   xpath=.//*[@id='auc-questions']/table/tbody/tr[5]/td[1]/span[1]
${locator.questions[4].description}                             xpath=.//*[@id='auc-questions']/table/tbody/tr[5]/td[2]
${locator.questions[4].date}                                    xpath=.//*[@id='auc-questions']/table/tbody/tr[5]/td[1]/span[2]
${locator.questions[4].answer}                                  xpath=.//*[@id='auc-questions']/table/tbody/tr[5]/td[3]
${locator.cancellations[0].status}                              xpath=html/body/div/div[2]/p[9]/span[1]
${locator.cancellations[0].reason}                              xpath=html/body/div/div[2]/p[9]/span[2]
${locator.awards[0].status}                                     xpath=.//*[@id='result-auc']/table/tbody/tr[1]/td[2]/p
${locator.awards[1].status}                                     xpath=.//*[@id='result-auc']/table/tbody/tr[2]/td[2]/p

*** Keywords ***
Підготувати клієнт для користувача
  [Arguments]     @{ARGUMENTS}
  [Documentation]  Відкрити брaвзер, створити обєкт api wrapper, тощо
  Open Browser  ${USERS.users['${ARGUMENTS[0]}'].homepage}  ${USERS.users['${ARGUMENTS[0]}'].browser}  alias=${ARGUMENTS[0]}
  Set Window Size       @{USERS.users['${ARGUMENTS[0]}'].size}
  Set Window Position   @{USERS.users['${ARGUMENTS[0]}'].position}
  Run Keyword If   '${ARGUMENTS[0]}' != 'tovprof_Viewer'   Login   ${ARGUMENTS[0]}

Підготувати дані для оголошення тендера
  [Arguments]  ${username}   ${tender_data}    ${role_name}
  [Return]     ${tender_data}

Підготувати дані для оголошення тендера користувачем
  [Arguments]      ${username}      ${tender_data}      ${role_name}
  [Documentation]  Відключити створення тендеру в тестовому режимі
  [Return]         ${tender_data}

Login
  [Arguments]  @{ARGUMENTS}
  Click Element    xpath=.//*[@id='navbar']/ul[2]/li[2]/a
  Sleep   1
  Input Text       xpath=html/body/div/div/div/div/div[2]/form/div[1]/input    ${USERS.users['${ARGUMENTS[0]}'].login}
  Input Text       xpath=html/body/div/div/div/div/div[2]/form/div[2]/input    ${USERS.users['${ARGUMENTS[0]}'].password}
  Click Element    xpath=html/body/div/div/div/div/div[2]/form/div[3]/button
  Sleep  1
  Click Element    xpath=.//*[@id='navbar']/ul[1]/li[2]/a

Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  Set Global Variable      ${TENDER_INIT_DATA_LIST}    ${ARGUMENTS[1]}
  ${title}=                Get From Dictionary         ${ARGUMENTS[1].data}                  title
  ${dgf}=                  Get From Dictionary         ${ARGUMENTS[1].data}                  dgfID
  ${dgfDecisionDate}=      convert_ISO_DMY             ${ARGUMENTS[1].data.dgfDecisionDate}
  ${dgfDecisionID}=        Get From Dictionary         ${ARGUMENTS[1].data}                  dgfDecisionID
  ${tenderAttempts}=       get_tenderAttempts          ${ARGUMENTS[1].data}
  ${description}=          Get From Dictionary         ${ARGUMENTS[1].data}                  description
  ${procuringEntity_name}=     Get From Dictionary     ${ARGUMENTS[1].data.procuringEntity}  name
  ${items}=                Get From Dictionary         ${ARGUMENTS[1].data}                  items
  ${budget}=               get_price                   ${ARGUMENTS[1]}
  ${step_rate}=            get_min_step                ${ARGUMENTS[1]}
  ${currency}=                 Get From Dictionary     ${ARGUMENTS[1].data.value}            currency
  ${valueAddedTaxIncluded}=    Get From Dictionary     ${ARGUMENTS[1].data.value}            valueAddedTaxIncluded
  ${start_auction}=        Get From Dictionary         ${ARGUMENTS[1].data.auctionPeriod}    startDate
  Switch Browser    ${ARGUMENTS[0]}
  Wait Until Page Contains Element     id=createAuction                                 20
  Click Element                        id=createAuction
  Wait Until Page Contains Element     id=auctionType                                   5
  Select From List By Value            id=auctionType                           ${ARGUMENTS[1].data.procurementMethodType}
  Input text                           xpath=//input[@name='title']             ${title}
  Input text                           xpath=//textarea[@name='description']    ${description}
  Input text                           xpath=//input[@name='dgfID']             ${dgf}
  Input text                           xpath=//input[@name='dgfDecisionId']     ${dgfDecisionID}
  Input text                           xpath=//input[@name='dgfDecisionDate']   ${dgfDecisionDate}
  Select From List By Value            xpath=//select[@name='tenderAttempts']   ${tenderAttempts}
  Input text                           xpath=//input[@name='price']             ${budget}
  Input text                           xpath=//input[@name='auctionPeriod']     ${start_auction}
  Input text                           xpath=//input[@name='minStep']           ${step_rate}
  Input text                           xpath=//input[@name='peName']            ${procuringEntity_name}
  ${number_of_items}=    Get Length    ${items}
  :FOR  ${index}  IN RANGE  ${number_of_items}
  \  Sleep  5
  \  Run Keyword If  '${index}' != '0'    Click Element    id=addItem
  \  Додати предмети  ${items[${index}]}    ${index}
  Sleep   1
  Click Element    xpath=html/body/div/div/div[2]/div/div[2]/form/button
  Sleep   1
  Wait Until Page Contains Element  id=publicAuction   5
  Click Element                     id=publicAuction
  Wait Until Page Contains          ${title}           5
  ${tender_id}=    Get Text        xpath=.//*[@id='aucId']/span[2]
  ${TENDER}=       Get Text        xpath=.//*[@id='aucId']/span[2]
  [return]    ${TENDER}

Додати предмети
  [Arguments]   ${item}   ${index}
  Wait Until Page Contains Element   xpath=//input[@name='item[${index}][description]']
  Input text                         xpath=//input[@name='item[${index}][description]']                       ${item.description}
  Input text                         xpath=//input[@name='item[${index}][quantity]']                          ${item.quantity}
  Click Element                      xpath=//div[select[@name='item[${index}][schemeId]'] != '']/div/a
  Input text                         xpath=//div[select[@name='item[${index}][schemeId]'] != '']/div/div/div/input   ${item.classification.id}
  Click Element                      xpath=//div[select[@name='item[${index}][schemeId]'] != '']/div/div/ul/li[1]
  Click Element                      xpath=//div[select[@name='item[${index}][unitCode]'] != '']/div/a
  Input text                         xpath=//div[select[@name='item[${index}][unitCode]'] != '']/div/div/div/input   ${item.unit.code}
  Click Element                      xpath=//div[select[@name='item[${index}][unitCode]'] != '']/div/div/ul/li[1]
  Input text                         xpath=//input[@name='item[${index}][postCode]']                          ${item.deliveryAddress.postalCode}
  Input text                         xpath=//input[@name='item[${index}][region]']                            ${item.deliveryAddress.region}
  Input text                         xpath=//input[@name='item[${index}][locality]']                          ${item.deliveryAddress.locality}
  Input text                         xpath=//input[@name='item[${index}][streetAddress]']                     ${item.deliveryAddress.streetAddress}

Завантажити документ
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${filepath}
  ...      ${ARGUMENTS[2]} ==  ${TENDER}
  tovprof.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}    ${ARGUMENTS[2]}
  Wait Until Page Contains Element    id=addDocument
  Click Element                       id=addDocument
  Choose File                         xpath=.//*[@id='modalAddDocument']/div/div/div[2]/form/div[2]/input    ${ARGUMENTS[1]}
  Sleep  1
  Click Element                       xpath=.//*[@id='modalAddDocument']/div/div/div[2]/form/button
  Sleep  3

Пошук тендера по ідентифікатору
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER}
  Switch Browser    ${ARGUMENTS[0]}
  Go to   ${USERS.users['${ARGUMENTS[0]}'].default_page}
  Wait Until Page Contains Element  id=searchInput
  Input Text                        id=searchInput    ${ARGUMENTS[1]}
  Click Element                     id=search_btn
  Wait Until Page Contains Element  xpath=html/body/div/div[1]/div[3]/p/span
  Click Element                     xpath=html/body/div/div[2]/div/div/div[2]/div/div/a
  Wait Until Page Contains Element  id=title

Задати питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  questionId
  ${title}=        Get From Dictionary  ${ARGUMENTS[2].data}  title
  ${description}=  Get From Dictionary  ${ARGUMENTS[2].data}  description
  Reload Page
  Wait Until Page Contains Element    id=addQuestion
  Click Element                       id=addQuestion
  Wait Until Page Contains Element    xpath=html/body/div/div/form/div[1]/input
  Input text                          xpath=html/body/div/div/form/div[1]/input    ${title}
  Input text                          xpath=html/body/div/div/form/div[2]/input    ${description}
  Click Element                       xpath=html/body/div/div/form/button

Скасувати закупівлю
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = tenderUaId
  ...      ${ARGUMENTS[2]} = cancellation_reason
  ...      ${ARGUMENTS[3]} = doc_path
  ...      ${ARGUMENTS[4]} = description
  tovprof.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}    ${ARGUMENTS[1]}
  Wait Until Page Contains Element   id=cancel
  Click Element     id=cancel
  Sleep   2
  Input text        xpath=.//*[@id='modalCancelAuction']/div/div/div[2]/form/div[1]/input    ${ARGUMENTS[2]}
  Choose File       xpath=.//*[@id='modalCancelAuction']/div/div/div[2]/form/div[2]/input    ${ARGUMENTS[3]}
  Input text        xpath=.//*[@id='modalCancelAuction']/div/div/div[2]/form/div[3]/input    ${ARGUMENTS[4]}
  Click Element     xpath=.//*[@id='modalCancelAuction']/div/div/div[2]/form/button
  Sleep   1
  Reload Page

Отримати інформацію про cancellations[0].status
  Reload Page
  ${return_value}=   Отримати текст із поля і показати на сторінці   cancellations[0].status
  [return]           ${return_value}

Отримати інформацію про cancellations[0].reason
  ${return_value}=   Отримати текст із поля і показати на сторінці   cancellations[0].reason
  [return]           ${return_value}

Оновити сторінку з тендером
  [Arguments]    @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  Switch Browser    ${ARGUMENTS[0]}
  tovprof.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}    ${ARGUMENTS[1]}

Отримати інформацію із предмету
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  item_id
  ...      ${ARGUMENTS[3]} ==  field_name
  ${return_value}=  Run Keyword And Return  tovprof.Отримати інформацію по предмету  ${username}  ${tender_uaid}  ${item_id}  ${field_name}
  [return]           ${return_value}

Отримати інформацію по предмету
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  item_id
  ...      ${ARGUMENTS[3]} ==  field_name
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=  Run Keyword If ${ARGUMENTS[3]} == 'quantity'               Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[2]/span[1]
  ...    ELSE  Run Keyword  If  ${AGUMENTS[3]} == 'unit.code'                   Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[2]/span[3]
  ...    ELSE  Run Keyword  If  ${AGUMENTS[3]} == 'unit.name'                   Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[2]/span[2]
  ...    ELSE  Run Keyword  If  ${AGUMENTS[3]} == 'description'                 Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[1]/span[1]
  ...    ELSE  Run Keyword  If  ${AGUMENTS[3]} == 'classification.id'           Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[1]/span[3]
  ...    ELSE  Run Keyword  If  ${AGUMENTS[3]} == 'classification.scheme'       Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[1]/span[2]
  ...    ELSE  Run Keyword  If  ${AGUMENTS[3]} == 'classification.description'  Get Text  xpath=html/body/div/div[3]/table/tbody/tr[@class='${item_id}']/td[1]/span[4]
  [return]    ${return_value}

Отримати інформацію із тендера
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[2]} ==  fieldname
  Sleep  1
  Click Element     xpath=html/body/div/div/div[2]/div/ul/li[2]/a
  ${return_value}=  Run Keyword  Отримати інформацію про ${ARGUMENTS[2]}
  [return]           ${return_value}

Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [return]           ${return_value}

Отримати інформацію про title
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [return]           ${return_value}

Отримати інформацію про procurementMethodType
  ${type}=           Отримати текст із поля і показати на сторінці   procurementMethodType
  ${return_value}=   tovprof_service.convert_tovprof_string_to_common_string         ${type}
  [return]           ${return_value}

Отримати інформацію про dgfID
  ${return_value}=   Отримати текст із поля і показати на сторінці   dgf
  [return]           ${return_value}

Отримати інформацію про dgfDecisionID
  ${return_value}=   Отримати текст із поля і показати на сторінці   dgfDecisionID
  [return]           ${return_value}

Отримати інформацію про dgfDecisionDate
  ${date_value}=   Отримати текст із поля і показати на сторінці   dgfDecisionDate
  ${return_value}=   tovprof_service.convert_date    ${date_value}
  [return]           ${return_value}

Отримати інформацію про tenderAttempts
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderAttempts
  ${return_value}=   Convert To Integer   ${return_value}
  [return]           ${return_value}

Отримати інформацію про eligibilityCriteria
  ${return_value}=   Отримати текст із поля і показати на сторінці   eligibilityCriteria

Отримати інформацію про status
  Reload Page
  ${status}=         Get Text   xpath=.//*[@id='status']/span[2]
  ${return_value}=   tovprof_service.convert_tovprof_string_to_common_string    ${status}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про description
  ${return_value}=   Отримати текст із поля і показати на сторінці   description
  [return]           ${return_value}

Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці  value.amount
  ${return_value}=   Convert To Number   ${return_value.replace(' ', '').replace(',', '.')}
  [return]           ${return_value}

Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   convert to number   ${return_value.replace(' ', '').replace(',', '.')}
  [return]           ${return_value}

Внести зміни в тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  fieldname
  ...      ${ARGUMENTS[3]} ==  fieldvalue
  Wait Until Page Contains Element   ${locator.edit.${ARGUMENTS[2]}}   5
  Input Text       ${locator.edit.${ARGUMENTS[2]}}   ${ARGUMENTS[3]}
  Click Element      id=btnPublic
  Wait Until Page Contains      Публікацію виконано        5
  ${result_field}=  Get Value   ${locator.edit.${ARGUMENTS[2]}}
  Should Be Equal   ${result_field}   ${ARGUMENTS[3]}

Отримати інформацію про items[${index}].quantity
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=    Отримати текст із поля і показати на сторінці   items[${index}].quantity
  ${return_value}=    Convert To Number   ${return_value}
  [return]           ${return_value}

Отримати інформацію про items[${index}].unit.code
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].unit.code
  [return]           ${return_value}

Отримати інформацію про items[${index}].unit.name
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].unit.name
  [return]           ${return_value}

Отримати інформацію про items[${index}].description
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].description
  [return]           ${return_value}

Отримати інформацію про items[${index}].classification.id
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.id
  [return]           ${return_value}

Отримати інформацію про items[${index}].classification.scheme
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.scheme
  [return]           ${return_value}

Отримати інформацію про items[${index}].classification.description
  sleep  1
  Click Element      xpath=html/body/div/div/div[2]/div/ul/li[3]/a
  sleep  1
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[${index}].classification.description
  [return]           ${return_value}

Отримати інформацію про value.currency
  ${currency}=   Отримати текст із поля і показати на сторінці  value.currency
  ${return_value}=   tovprof_service.convert_tovprof_string_to_common_string        ${currency}
  [return]           ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded
  ${tax}=    Отримати текст із поля і показати на сторінці  value.valueAddedTaxIncluded
  ${return_value}=   tovprof_service.convert_tovprof_string_to_common_string        ${tax}
  [return]           ${return_value}

Отримати інформацію про auctionID
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderId
  [return]           ${return_value}

Отримати інформацію про procuringEntity.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   procuringEntity.name
  [return]           ${return_value}

Отримати інформацію про items[0].deliveryLocation.latitude
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryLocation.latitude
  ${return_value}=   Convert To Number   ${return_value}
  [return]           ${return_value}

Отримати інформацію про items[0].deliveryLocation.longitude
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryLocation.longitude
  ${return_value}=   Convert To Number   ${return_value}
  [return]           ${return_value}

Отримати інформацію про auctionPeriod.startDate
  ${value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.startDate
  ${return_value}=   tovprof_service.convert_date_time_to_iso   ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про auctionPeriod.endDate
  Reload Page
  ${value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.endDate
  ${return_value}=   tovprof_service.convert_date_time_to_iso   ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про tenderPeriod.startDate
  ${value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   tovprof_service.convert_date_time_to_iso   ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про tenderPeriod.endDate
  ${value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   tovprof_service.convert_date_time_to_iso   ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про enquiryPeriod.startDate
  ${value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   tovprof_service.convert_date_time_to_iso   ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про enquiryPeriod.endDate
  ${value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   tovprof_service.convert_date_time_to_iso   ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.countryName
  [return]           ${return_value.split(', ')[0]}

Отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.postalCode
  [return]           ${return_value.split(', ')[1]}

Отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.region
  [return]           ${return_value.split(', ')[2]}

Отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.locality
  [return]           ${return_value.split(', ')[3]}

Отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.streetAddress
  [return]           ${return_value.split(', ')[4]}

Отримати інформацію про items[0].deliveryDate.endDate
  ${date_value}=     Отримати текст із поля і показати на сторінці  items[0].deliveryDate.endDate
  ${return_value}=   tovprof_service.convert_date    ${date_value}
  [return]           ${return_value}

Отримати інформацію про questions[${index}].title
  log to console  ${index}
  ${index}=    inc    ${index}
  Sleep  1
  Click Element    xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Wait Until Page Contains Element    xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[1]/span[1]
  ${return_value}=   Get text         xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[1]/span[1]
  [return]           ${return_value}

Отримати інформацію про questions[${index}].description
  log to console  ${index}
  ${index}=    inc    ${index}
  Sleep  1
  Click Element    xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Wait Until Page Contains Element    xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[2]
  ${return_value}=   Get text         xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[2]
  [return]           ${return_value}

Отримати інформацію про questions[${index}].answer
  log to console  ${index}
  ${index}=    inc    ${index}
  Sleep  1
  Click Element    xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Wait Until Page Contains Element    xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[3]
  ${return_value}=   Get text         xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[3]
  [return]           ${return_value}

Отримати інформацію про questions[${index}].date
  log to console  ${index}
  ${index}=    inc    ${index}
  Sleep  1
  Click Element    xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Wait Until Page Contains Element    xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[1]/span[2]
  ${return_value}=   Get text         xpath=.//*[@id='auc-questions']/table/tbody/tr[${index}]/td[1]/span[2]
  [return]           ${return_value}

Отримати інформацію про awards[${index}].status
  Reload Page
  log to console  ${index}
  ${index}=    inc    ${index}
  Sleep  1
  Click Element            xpath=html/body/div/div/div[2]/div/ul/li[1]/a
  Sleep  1
  ${value}=    Get Text    xpath=.//*[@id='result-auc']/table/tbody/tr[${index}]/td[2]/p
  ${return_value}=   tovprof_service.convert_tovprof_string_to_common_string    ${value}
  log to console     ${value}
  log to console     ${return_value}
  [return]           ${return_value}

Подати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  ...    ${ARGUMENTS[2]} ==  ${test_bid_data}
  ${amount}=    get_str          ${ARGUMENTS[2].data.value.amount}
  ${is_qualified}=   is_qualified         ${ARGUMENTS[2]}
  ${is_eligible}=    is_eligible          ${ARGUMENTS[2]}
  tovprof.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}  ${ARGUMENTS[1]}
  Wait Until Page Contains Element    id=makeBid
  Click Element                       id=makeBid
  Sleep   1
  Wait Until Page Contains Element    xpath=.//*[@id='modalMakeBid']//input[@name="bidValue"]
  Input Text                          xpath=.//*[@id='modalMakeBid']//input[@name="bidValue"]    ${amount}
  Run Keyword If    ${is_qualified}   Sleep  1
  ...  ELSE  ${amount}=  0
  Click Element     xpath=.//*[@id='modalMakeBid']//button[@type="submit"]
  [return]          ${amount}

Скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  tovprof.Пошук тендера по ідентифікатору  ${ARGUMENTS[0]}  ${ARGUMENTS[1]}
  Wait Until Page Contains Element    id=editBid
  Click Element                       id=editBid
  Sleep  1
  Wait Until Page Contains Element    id=deleteBid
  Click Element       id=deleteBid

Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}   ${field}
  tovprof.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element    id=editBid
  Click Element                       id=editBid
  Sleep   1
  ${value}=   Get Value               xpath=.//*[@id='modalChangeBid']//input[@name="value"]
  ${value}=   Convert To Number       ${value}
  [Return]    ${value}

Змінити цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  ...    ${ARGUMENTS[2]} ==  amount
  ...    ${ARGUMENTS[3]} ==  amount.value
  ${amount}=    get_str          ${ARGUMENTS[3]}
  Reload Page
  Wait Until Page Contains Element    id=editBid
  Click Element                       id=editBid
  Sleep   1
  Wait Until Page Contains Element    xpath=.//*[@id='modalChangeBid']//input[@name="value"]
  Input Text                          xpath=.//*[@id='modalChangeBid']//input[@name="value"]    ${amount}
  sleep   1
  Click Element                       xpath=.//*[@id='modalChangeBid']//button[@type="submit"]

Завантажити документ в ставку
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  tenderId
  Wait Until Page Contains Element    id=editBid
  Click Element                       id=editBid
  Sleep   1
  Choose File                         xpath=.//*[@id='modalChangeBid']//input[@name="bidFile"]   ${ARGUMENTS[1]}
  Sleep   1
  Click Element                       xpath=.//*[@id='modalChangeBid']//button[@type="submit"]

Змінити документ в ставці
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  bidId
  Wait Until Page Contains Element    id=editBid
  Click Element                       id=editBid
  Sleep   1
  Choose File                         xpath=.//*[@id='modalChangeBid']//input[@name="bidFile"]   ${ARGUMENTS[1]}
  Sleep   1
  Click Element                       xpath=.//*[@id='modalChangeBid']//button[@type="submit"]

Завантажити фінансову ліцензію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  Reload Page
  Wait Until Page Contains Element    xpath=.//*[@id='navbar']/ul[2]/li[1]/a
  Click Element                       xpath=.//*[@id='navbar']/ul[2]/li[1]/a
  Wait Until Page Contains Element    xpath=//div[@class="panel panel-default"][1]/ul/li[2]/a
  Click Element                       xpath=//div[@class="panel panel-default"][1]/ul/li[2]/a
  Wait Until Page Contains Element    id=documents_upload
  Choose File                         id=documents_upload     ${filepath}
  Click Element                       xpath=html//form/div[3]/button[@type="submit"]
  Sleep  1

Отримати інформацію про bids
  [Arguments]  @{ARGUMENTS}
  Викликати для учасника  ${ARGUMENTS[0]}  Оновити сторінку з тендером  ${ARGUMENTS[1]}
  Click Element                       id=bids_ref

Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  Reload Page
  Wait Until Page Contains Element     xpath=html/body/div[1]/div/div[1]/div[2]/div[2]/div[1]/a
  ${result} =   Get Element Attribute  xpath=html/body/div[1]/div/div[1]/div[2]/div[2]/div[1]/a@href
  log to console  ${result}
  [return]   ${result}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  Reload Page
  Wait Until Page Contains Element     xpath=html/body/div[1]/div/div[1]/div[2]/div[2]/div[1]/a
  ${result} =   Get Element Attribute  xpath=html/body/div[1]/div/div[1]/div[2]/div[2]/div[1]/a@href
  log to console  ${result}
  [return]   ${result}

Завантажити документ в тендер з типом
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${doc_type}
  Reload Page
  Wait Until Page Contains Element    id=addDocument
  Click Element                       id=addDocument
  Choose File                         xpath=.//*[@id='modalAddDocument']/div/div/div[2]/form/div[2]/input     ${filepath}
  Sleep    1
  Select From List By Value           xpath=.//*[@id='modalAddDocument']/div/div/div[2]/form/div[1]/select    ${doc_type}
  Sleep    1
  Click Element                       xpath=.//*[@id='modalAddDocument']/div/div/div[2]/form/button

Завантажити ілюстрацію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  tovprof.Завантажити документ в тендер з типом  ${username}  ${tender_uaid}  ${filepath}  illustration

Додати Virtual Data Room
  [Arguments]  ${username}  ${tender_uaid}  ${url}
  Reload Page
  Wait Until Page Contains Element    id=addLink
  Click Element                       id=addLink
  Sleep    1
  Input text                          xpath=.//*[@id='modalAddLink']/div/div/div[2]/form/div[2]/input     ${url}
  Sleep    1
  Select From List By Value           xpath=.//*[@id='modalAddLink']/div/div/div[2]/form/div[1]/select    virtualDataRoom
  Sleep    1
  Click Element                       xpath=.//*[@id='modalAddLink']/div/div/div[2]/form/button

Додати публічний паспорт активу
  [Arguments]  ${username}  ${tender_uaid}  ${url}
  Reload Page
  Wait Until Page Contains Element    id=addLink
  Click Element                       id=addLink
  Sleep    1
  Input text                          xpath=.//*[@id='modalAddLink']/div/div/div[2]/form/div[2]/input     ${url}
  Sleep    1
  Select From List By Value           xpath=.//*[@id='modalAddLink']/div/div/div[2]/form/div[1]/select    x_dgfPublicAssetCertificate
  Sleep    1
  Click Element                       xpath=.//*[@id='modalAddLink']/div/div/div[2]/form/button

Додати офлайн документ
  [Arguments]  ${username}  ${tender_uaid}  ${accessDetails}
  Reload Page
  Wait Until Page Contains Element       id=addFamiliarization
  Click Element                          id=addFamiliarization
  Sleep  1
  Input text                             xpath=.//*[@id='modalAddFamiliarization']/div/div/div[2]/form/div/textarea    ${accessDetails}
  Click Element                          xpath=.//*[@id='modalAddFamiliarization']/div/div/div[2]/form/button

Отримати інформацію із документа по індексу
  [Arguments]  ${username}  ${tender_uaid}  ${document_index}  ${field}
  Reload Page
  Sleep  1
  Click Element    xpath=html/body/div/div/div[2]/div/ul/li[4]/a
  Sleep  1
  log to console  ${field}
  log to console  ${document_index}
  ${document_index}=  inc  ${document_index}
  ${doc_value}=  Run Keyword If  '${field}' == 'description'
  ...    Get Text            xpath=.//*[@id='auc-docs']/table/tbody/tr[${document_index}]/td[1]/a/p
  ...    ELSE    Get Text    xpath=.//*[@id='auc-docs']/table/tbody/tr[${document_index}]/td[2]
  ${doc_value}=  Run Keyword If  '${field}' == 'documentType'
  ...    convert_document_type  ${doc_value}
  [return]  ${doc_value}

Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field_name}
  Reload Page
  Sleep  1
  Click Element    xpath=html/body/div/div/div[2]/div/ul/li[4]/a
  Sleep  1
  log to console  ${field_name}
  log to console  ${doc_id}
  ${doc_value}=  Run Keyword If  '${field_name}' == 'documentType'
  ...    Get Text            xpath=.//*[@id='auc-docs']/table/tbody/tr[@class='doc ${doc_id}']/td[2]
  ...    ELSE    Get Text    xpath=.//*[@id='auc-docs']/table/tbody/tr[@class='doc ${doc_id}']/td[1]/a/p
  ${doc_value}=  Run Keyword If  '${field_name}' == 'documentType'
  ...    convert_document_type  ${doc_value}
  ...    ELSE    Get Text    xpath=.//*[@id='auc-docs']/table/tbody/tr[@class='doc ${doc_id}']/td[1]/a/p
  [Return]   ${doc_value}

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${item_id}
  Reload Page
  Wait Until Page Contains Element      xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Click Element                         xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Wait Until Page Contains Element      xpath=.//*[@id='auc-questions']/table/tbody/tr[@class='${item_id}']/td[3]/*[@id='addAnswer']
  Click Element                         xpath=.//*[@id='auc-questions']/table/tbody/tr[@class='${item_id}']/td[3]/*[@id='addAnswer']
  Sleep  1
  Wait Until Page Contains Element      xpath=.//*[@id='modalAddAnswer']//form//textarea
  Focus                                 xpath=.//*[@id='modalAddAnswer']//form//textarea
  Input Text                            xpath=.//*[@id='modalAddAnswer']//form//textarea    ${answer_data.data.answer}
  Click Element                         xpath=.//*[@id='modalAddAnswer']//form//button

Отримати кількість предметів в тендері
  [Arguments]  ${username}  ${tender_uaid}
  Reload Page
  ${return_value}=    Get Text           id=items-count-info
  ${return_value}=    Convert To Number  ${return_value}
  [return]            ${return_value}

Отримати кількість документів в тендері
  [Arguments]  ${username}  ${tender_uaid}
  Reload Page
  Wait Until Page Contains Element       id=docs-count-info
  ${return_value}=    Get Text           id=docs-count-info
  ${return_value}=    Convert To Number  ${return_value}
  [Return]  ${return_value}

Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}    ${question_id}  ${field_name}
  Reload Page
  Sleep  1
  Click Element         xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  log to console  ${question_id}
  log to console  ${field_name}
  ${return_value}=      Run Keyword If    '${field_name}' == 'title'
  ...     Get Text                                             xpath=.//*[@id='auc-questions']/table/tbody/tr[@class='${question_id}']/td[1]/span[1]
  ...     ELSE IF  '${field_name}' == 'answer'     Get Text    xpath=.//*[@id='auc-questions']/table/tbody/tr[@class='${question_id}']/td[3]
  ...     ELSE    Get Text                                     xpath=.//*[@id='auc-questions']/table/tbody/tr[@class='${question_id}']/td[2]
  [return]           ${return_value}

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  Reload Page
  Wait Until Page Contains Element      xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Click Element                         xpath=html/body/div/div/div[2]/div/ul/li[5]/a
  Sleep  1
  Wait Until Page Contains Element    id=addQuestion
  Click Element                       id=addQuestion
  Sleep  1
  Input text                          xpath=.//*[@id='modalAddQuestion']//input[@name="title"]             ${question.data.title}
  Input text                          xpath=.//*[@id='modalAddQuestion']//textarea[@name="description"]    ${question.data.description}
  Click Element                       xpath=.//*[@id='modalAddQuestion']//button[@type="submit"]

Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
  tovprof.Задати запитання на тендер  ${username}  ${tender_uaid}  ${question}

Додати предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  Reload Page
  ${index}=  tovprof.Отримати кількість предметів в тендері     ${username}   ${tender_uaid}

Видалити предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}
  Reload Page

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  Reload Page
  log to console  ${doc_id}
  Click Element   xpath=html/body/div/div/div[2]/div/ul/li[4]/a
  Sleep   1
  Click Element   xpath=//*[@id='auc-docs']//tr[contains(@class, 'doc ${doc_id}')]/td[1]/a/p
  sleep   1
  ${file_name}=   Get Text    xpath=.//*[@id='auc-docs']/table/tbody/tr[@class='doc ${doc_id}']/td[1]/a/p
  ${url}=   Get Element Attribute    xpath=.//*[@id='auc-docs']/table/tbody/tr[@class='doc ${doc_id}']/td[1]/a@href
  download_file   ${url}  ${file_name.split('/')[-1]}  ${OUTPUT_DIR}
  [return]  ${file_name.split('/')[-1]}

Отримати дані із документу пропозиції
  [Arguments]  ${username}  ${tender_uaid}  ${bid_index}  ${document_index}  ${field}
  Reload Page
  Wait Until Page Contains Element    id=qualification
  Click Element                       id=qualification
  ${document_index}=                  inc    ${document_index}
  ${result}=   Get Text               xpath=html/body/div/div/div[1]/div[${document_index}]/p[1]/span[2]
  [Return]   ${result}

Отримати кількість документів в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${bid_index}
  Reload Page
  Wait Until Page Contains Element                id=qualification
  Click Element                                   id=qualification
  ${bid_doc_number}=  Get Matching Xpath Count    xpath=html/body/div/div/div[1]/div[@class = 'document']
  [Return]  ${bid_doc_number}

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  tovprof.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element      id=disqualification
  Click Element                         id=disqualification

Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  tovprof.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element    id=qualification
  Click Element                       id=qualification
  Click Element                       xpath=html/body/div/div/div[2]/form[2]/button

Дискваліфікувати постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}  ${description}
  tovprof.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element    id=qualification
  Click Element                       id=qualification
  Input Text                          xpath=html/body/div/div/div[2]/form[3]/div/input  ${description}
  click Element                       xpath=html/body/div/div/div[2]/form[3]/button

Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${filepath}  ${tender_uaid}  ${award_num}
  tovprof.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element    id=qualification
  Click Element                       id=qualification
  Choose File                         xpath=html/body/div/div/div[2]/form[1]/div/input   ${filepath}
  Sleep   2
  Click Element                       xpath=html/body/div/div/div[2]/form[1]/button

Завантажити протокол аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${award_index}
  tovprof.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element    id=addProtocol
  Click Element                       id=addProtocol
  Sleep   1
  Choose File                         xpath=.//*[@class='modal fade in']/div/div/div[2]/form/div/input   ${filepath}
  Sleep   1
  Click Element                       xpath=.//*[@class='modal fade in']/div/div/div[2]/form/button

Завантажити протокол аукціону в авард
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${award_index}
  Reload Page
  tovprof.Завантажити протокол аукціону  ${username}  ${tender_uaid}  ${filepath}  ${award_index}

Завантажити угоду до тендера
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${filepath}
  Reload Page
  Wait Until Page Contains Element          id=contract
  Click Element                             id=contract
  Choose File                               xpath=html/body/div/div/div[2]/form[1]/div/input   ${filepath}
  Sleep   2
  Click Element                             xpath=html/body/div/div/div[2]/form[1]/button

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  ${file_path}  ${file_title}  ${file_content}=   create_fake_doc
  Sleep    1
  tovprof.Завантажити угоду до тендера   ${username}  ${tender_uaid}  1  ${filepath}
  Wait Until Page Contains Element    xpath=html/body/div/div/div[2]/form[2]/button
  Click Element                       xpath=html/body/div/div/div[2]/form[2]/button

Підтвердити наявність протоколу аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${award_index}
  tovprof.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Reload Page
  Wait Until Page Contains Element    id=qualification
  Click Element                       id=qualification
  ${docs}=   Get Matching Xpath Count   xpath=html/body/div/div/div[1]/div[@class = 'document']
  Should Be True  ${docs} > 1