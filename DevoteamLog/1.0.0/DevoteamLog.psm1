Enum Category {
    Information
    Warning
    Error
 }

class LogEntry {
    [datetime] $TimeStamp
    [Category] $Category
    [string] $Message

    LogEntry ([datetime] $TimeStamp, [Category] $Category, [string] $Message) {
        $this.TimeStamp = $TimeStamp
        $this.Category = $Category
        $this.Message = $Message
    }
}

function ConvertFrom-Log {
    [CmdletBinding()]
    param (
        [Parameter (Mandatory)] [String] $FilePath
    )

    foreach ($line in Get-Content $FilePath) {
        [datetime]$time = $line.Split(';')[0]
        [Category]$Category = $line.Split(';')[1].trim()
        $Message = $line.Split(';')[2].Trim()

        [LogEntry]::new($time,$Category,$Message)
    }
}




 function Write-Log
 {
<#
.Synopsis
   This function aims at creating a well formatted logfile.

.DESCRIPTION
   This function allows you to create logs with a header, a footer and enables you to display 
   the logs on the console along with writing to disk.

.EXAMPLE
   Write-Log -Header -FilePath c:\temp\logs.txt

   Writes the header

.EXAMPLE
   Write-Log -Footer -FilePath c:\temp\logs.txt

   Writes the footer

.EXAMPLE
   Write-Log -Category Information -Message 'This is a test message' -FilePath c:\temp\logs.txt

   Writes an information message.

.NOTES
   v0.1.0 : First release by Ives
   v0.1.1 : Adding Enum Category
#>    
     [CmdletBinding(DefaultParameterSetName='Parameter Set 3', 
                   SupportsShouldProcess=$true)]
     Param
     (
         # Param1 help description
         [Parameter(Mandatory=$true,
                    ParameterSetName='Parameter Set 3')]
         [Category]
         $Category,
 
         # Param2 help description
         [Parameter(Mandatory=$true, 
                    ParameterSetName='Parameter Set 1')]
         [Switch]
         $Header,
 
         # Param3 help description
         [Parameter(Mandatory=$true, 
         ParameterSetName='Parameter Set 2')]
         [Switch]
         $Footer,
 
         [Parameter(Mandatory=$true)]
         [String]
         $Filepath,
 
         [Parameter(Mandatory=$false)]
         [Switch]
         $Toscreen,
 
         [Parameter(Mandatory=$true, 
         ParameterSetName='Parameter Set 3'
         )]
         [String]
         $Message
 
 
     )
 

}