﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <link rel="stylesheet" type="text/css"
        href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: 'http://localhost:2222/api/datatable/getemployees',
                method: 'get',
                dataType: 'jsonp',
                success: function (data) {
                    $('#datatable').dataTable({
                        paging: true,
                        sort: true,
                        searching: true,
                        data: data,
                        columns: [
                            { 'data': 'Id' },
                            { 'data': 'FirstName' },
                            { 'data': 'LastName' },
                            { 'data': 'Gender' },
                            { 'data': 'JobTitle' },
                            {
                                'data': 'WebSite',
                                'sortable': false,
                                'searchable': false,
                                'render': function (webSite) {
                                    if (!webSite) {
                                        return 'N/A';
                                    }
                                    else {
                                        return '<a href=' + webSite + '>'
                                            + webSite.substr(0, 10) + '...' + '</a>';
                                    }
                                }
                            },
                            {
                                'data': 'Salary',
                                'render': function (salary) {
                                    return "$" + salary;
                                }
                            },
                            {
                                'data': 'HireDate',
                                'render': function (jsonDate) {
                                    var date = new Date(parseInt(jsonDate.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return month + "/" + date.getDate() + "/" + date.getFullYear();
                                }
                            }
                        ]
                    });
                }
            });
        });
    </script>
</head>
<body style="font-family: Arial">
    <form id="form1" runat="server">
        <div style="width: 900px; border: 1px solid black; padding: 3px">
            <table id="datatable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                        <th>Web Site</th>
                        <th>Salary</th>
                        <th>Hire Date</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Job Title</th>
                        <th>Web Site</th>
                        <th>Salary</th>
                        <th>Hire Date</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>