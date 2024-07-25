#' 按纽生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' MouldResumeUI()
MouldResumeUI <- function(tabTitle ='摸具履历',
                     colTitles =c('操作区域','操作区域','显示区域'),
                     widthRates =c(6,6,12),
                     func_left = MouldResumeUI_left,
                     func_right =MouldResumeUI_right,
                     func_bottom = MouldResumeUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' MouldResumeUI_left()
MouldResumeUI_left <- function() {


  res <- tagList(
    #shiny::actionButton(inputId = 'btn_shiny',label = 'shiny按纽'),
    #shiny::h5('按纽在shiny中可以作为计数器'),
    #shiny::uiOutput(outputId = 'ui_shinyButton'),
    #shiny::h5('每秒钟更新一次按纽显示文本'),
    #shiny::actionButton(inputId = 'btn_shinyWidgets',label = '按纽显示当前时间'),
    tsui::uiTemplate(templateName = '博宇翔鹰-模具履历_模板表'),
    tsui::mdl_file(id='file_MouldResume',label='上传手工调整单'),
    shiny::actionButton(inputId ='btn_MouldResume_pre',label ='预览文件内容'),
    shiny::actionButton(inputId ='btn_MouldResume_upload',label ='上传文件'),
  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' MouldResumeUI_bottom()
MouldResumeUI_right <- function() {
  res <- tagList(


    tsui::mdl_text2(id = "text_MouldResume_FMoldNumber",label =" 查询的模具编号"),
    tsui::mdl_text2(id = "text_MouldResume_FMoldNumber_delete",label ="删除模具的编号" ),
    tsui::mdl_date(id="text_MouldResume_FOutboundDate_delete",label =" 删除模具出库的日期"),


    shiny::actionButton(inputId ='btn_MouldResume_view',label ='查询数据'),


    shiny::actionButton(inputId ='btn_MouldResume_delete',label ='删除数据'),

    tsui::mdl_download_button(id = 'btn_download',label = '下载查询的数据'),


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' MouldResumeUI_bottom()
MouldResumeUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_MouldResume'))
  )
  return(res)

}
