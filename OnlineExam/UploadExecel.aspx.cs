using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExam
{
    public partial class UploadExecel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)  //fileupload control contains a file  
        //        try
        //        {
        //            using (var stream = new MemoryStream())
        //            {
        //                FileUpload1
        //            }
                      
        //            FileUpload1.SaveAs("E:\\" + FileUpload1.FileName);          // file path where you want to upload  
        //            Label1.Text = "File Uploaded Sucessfully !! " + FileUpload1.PostedFile.ContentLength + "mb";     // get the size of the uploaded file  
        //        }
        //        catch (Exception ex)
        //        {
        //            Label1.Text = "File Not Uploaded!!" + ex.Message.ToString();
        //        }
        //    else
        //    {
        //        Label1.Text = "Please Select File and Upload Again";

        //    }
        //}

        //public int UploadExcel(IFormFile file)
        //{
        //    var Sheet1 = new List<FirstSheet>();
        //    var Sheet2 = new List<SecondSheet>();
        //    int result = 0;
        //    using (var stream = new MemoryStream())
        //    {
        //        file.CopyTo(stream);
        //        using (var package = new ExcelPackage(stream))
        //        {
        //            ExcelWorksheet worksheet = package.Workbook.Worksheets[0];
        //            ExcelWorksheet worksheet2 = package.Workbook.Worksheets[1];
        //            var rowCount = worksheet.Dimension.Rows;
        //            for (var row = 2; row <= rowCount; row++)
        //            {
        //                Sheet1.Add(new FirstSheet
        //                {
        //                    Id = Convert.ToInt32(worksheet.Cells[row, 1].Value.ToString().Trim()),
        //                    Name = worksheet.Cells[row, 2].Value.ToString().Trim(),
        //                    Score = Convert.ToInt32(worksheet.Cells[row, 1].Value.ToString().Trim())
        //                });
        //            }
        //            var rowCount2 = worksheet2.Dimension.Rows;
        //            for (var row = 2; row <= rowCount2; row++)
        //            {
        //                Sheet2.Add(new SecondSheet
        //                {
        //                    Id = Convert.ToInt32(worksheet2.Cells[row, 1].Value.ToString().Trim()),
        //                    Salary = Convert.ToInt32(worksheet2.Cells[row, 2].Value.ToString().Trim()),
        //                    Bonous = Convert.ToInt32(worksheet2.Cells[row, 3].Value.ToString().Trim()),

        //                });

        //            }

        //        }
        //    }
        //    var x = Sheet1;
        //    var y = Sheet1;
        //    var first = excelGateWay.InsertEmployee(Sheet1);
        //    var second = excelGateWay.InsertSalary(Sheet2);
        //    return result;
        //}
    }
}