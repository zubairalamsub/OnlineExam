<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadExecel.aspx.cs" Inherits="OnlineExam.UploadExecel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.9/angular.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/danialfarid-angular-file-upload/12.2.13/ng-file-upload.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/xlsx.full.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.13.5/jszip.js"></script>
    <script type="text/javascript">
        var app = angular.module('MyApp', ['ngFileUpload'])
        app.controller('MyController', function ($scope,$http) {
            $scope.SelectFile = function (file) {
                $scope.SelectedFile = file;
            };
            $scope.Upload = function () {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$/;
                if (regex.test($scope.SelectedFile.name.toLowerCase())) {
                    if (typeof (FileReader) != "undefined") {
                        var reader = new FileReader();
                        //For Browsers other than IE.
                        if (reader.readAsBinaryString) {
                            reader.onload = function (e) {
                                $scope.ProcessExcel(e.target.result);
                            };
                            reader.readAsBinaryString($scope.SelectedFile);
                        } else {
                            //For IE Browser.
                            reader.onload = function (e) {
                                var data = "";
                                var bytes = new Uint8Array(e.target.result);
                                for (var i = 0; i < bytes.byteLength; i++) {
                                    data += String.fromCharCode(bytes[i]);
                                }
                                $scope.ProcessExcel(data);
                            };
                            reader.readAsArrayBuffer($scope.SelectedFile);
                        }
                    } else {
                       alert("This browser does not support HTML5.");
                    }
                } else {
                    alert("Please upload a valid Excel file.");
                }
            };

            $scope.ProcessExcel = function (data) {
                //Read the Excel File data.
                var workbook = XLSX.read(data, {
                    type: 'binary'
                });

                //Fetch the name of First Sheet.
                var firstSheet = workbook.SheetNames[0];
                var secondSheet = workbook.SheetNames[1];
                
               


                //Read all rows from First Sheet into an JSON array.
                var excelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[firstSheet]);
                var SndexcelRows = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[secondSheet]);
                var obj = {
                    first:excelRows,
                    sceond:SndexcelRows

                };
                console.log(obj);

                console.log(excelRows);
                console.log(SndexcelRows);
				var post = $http({
					method: "POST",
					url: "uploadexecel.aspx/savepage",
					dataType: 'json',
					//data: "{'myArray1':"+JSON.stringify(excelRows)+",'myArray2':"+JSON.stringify(SndexcelRows)+"}",

					data: { name: 'Zubair'},
					headers: { "Content-Type": "application/json" }
				});

				post.success(function (data, status) {
					console.log(data.d);
				});

				post.error(function (data, status) {
					console.log(data.Message);
				});
			


                //Display the data from Excel file in Table.
                $scope.$apply(function () {
                    $scope.Customers = excelRows;
                    $scope.IsVisible = true;
                });
            };
        });
	</script>
    <div ng-app="MyApp" ng-controller="MyController">
        <input type="file" ngf-select="SelectFile($file)" />
        <input type="button" value="Upload" ng-click="Upload()" />
        <hr />
        <table id="tblCustomers" cellpadding="0" cellspacing="0" ng-show="IsVisible">
            <tr>
                <th>Customer Id</th>
                <th>Name</th>
                <th>Country</th>
            </tr>
            <tbody ng-repeat="m in Customers">
                <tr>
                    <td>{{m.Id}}</td>
                    <td>{{m.Name}}</td>
                    <td>{{m.Country}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
