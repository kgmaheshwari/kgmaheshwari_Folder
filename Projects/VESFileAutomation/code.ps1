Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName PresentationFramework


	function Unzip
	{
	    param([string]$zipfile, [string]$outpath)

	    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
	}

	$files = Get-ChildItem "C:\Users\Nalam Karun Kumar\Desktop\ZippedFiles\*.zip"
	foreach ($file in $files) 
	{
        try
        {
		    $name = $file.fullname
		    Unzip "$name" "C:\Users\Nalam Karun Kumar\Desktop\ZippedFiles"
            Remove-Item $name
        }
        catch [system.Exception]
        {
           [System.Windows.MessageBox]::Show("Failed to Unzip the file " + $name)
        }
	}