msi_file = WScript.Arguments(0)

Set wi = CreateObject("WindowsInstaller.Installer")

Const open_database_mode_read_only = 0
Set db = wi.OpenDatabase(msi_file, open_database_mode_read_only)

Set view = db.OpenView("select Value from Property where Property = 'ProductName'")
view.Execute
Set rec = view.Fetch
WScript.Echo "Product Name    : " & rec.StringData(1)

Set view = db.OpenView("select Value from Property where Property = 'Manufacturer'")
view.Execute
Set rec = view.Fetch
WScript.Echo "Manufacturer    : " & rec.StringData(1)

Set view = db.OpenView("select Value from Property where Property = 'ProductCode'")
view.Execute
Set rec = view.Fetch
WScript.Echo "Product Code    : " & rec.StringData(1)

Set view = db.OpenView("select Value from Property where Property = 'ProductVersion'")
view.Execute
Set rec = view.Fetch
WScript.Echo "Product Version : " & rec.StringData(1)

WScript.Echo ""
WScript.Echo "Press <Enter> to quit"
WScript.StdIn.Read(1)
