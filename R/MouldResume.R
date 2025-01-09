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
MouldResumeUI <- function(tabTitle ='模具履历',
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
    tsui::uiTemplate(templateName = '模具履历信息表'),
    tsui::mdl_file(id='file_MouldResume',label='上传模具履历信息表'),
    tsui::layout_2C(x =shiny::actionButton(inputId ='btn_MouldResume_pre',label ='预览文件内容'),
                    y=shiny::actionButton(inputId ='btn_MouldResume_upload',label ='上传文件')),
     tsui::mdl_text2(id = 'text_MouldResume_mould_fbillno',label = '请输入模具编号'),
     shiny::actionButton(inputId ='btn_MouldResume_mould_fbillno_view',label ='查询模具信息'),
    tsui::mdl_text2(id = 'text_MouldResume_mould_fbillno_delete',label = '需删除模具编号'),
     shiny::actionButton(inputId ='btn_MouldResume_mould_fbillno_delete',label ='按模具编号删除数据') ,


    tsui::layout_2C(x = tsui::mdl_text2(id = 'text_MouldResume_erp_fyear',label = '请输入年份'),
                    y = tsui::mdl_text2(id = 'text_MouldResume_erp_fmonth',label = '请输入月份')
                    ),
    shiny::actionButton(inputId ='btn_MouldResume_product_get',label ='按年月获取erp生产数据')




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

    tsui::layout_2C(x = tsui::mdl_text2(id = 'text_MouldResume_dms_fyear',label = '请输入年份'),
                    y = tsui::mdl_text2(id = 'text_MouldResume_dms_fmonth',label = '请输入月份')),

    tsui::layout_2C(x = shiny::actionButton(inputId ='btn_MouldResume_get',label ='按年月获取模具生产数据'),
                    y = tsui::mdl_download_button(id = 'btn_MouldResume_get_download',label = '下载模具生产数据')),

    tsui::mdl_file(id='file_MouldResume_update',label='模具履历生产信息表'),
    tsui::layout_2C(x =shiny::actionButton(inputId ='btn_MouldResume_preview',label ='预览文件内容'),
                    y=shiny::actionButton(inputId ='btn_MouldResume_update_upload',label ='上传文件')),


    tsui::mdl_text2(id = "text_MouldResume_FMoldNumber",label =" 查询的模具编号"),
    tsui::layout_2C(x =   shiny::actionButton(inputId ='btn_MouldResume_view',label ='查询数据'),
                    y = tsui::mdl_download_button(id = 'btn_download',label = '下载数据')),

    tsui::layout_2C(x =tsui::mdl_text2(id = "text_MouldResume_FMoldNumber_delete",label ="删除模具的编号" ),
                    y = tsui::mdl_date(id="text_MouldResume_FOutboundDate_delete",label =" 删除模具出库的日期")),
    shiny::actionButton(inputId ='btn_MouldResume_delete',label ='删除数据')






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
