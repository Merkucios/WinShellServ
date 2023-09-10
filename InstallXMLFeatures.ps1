# Insert Path to XML-File
#   Example: C:\Documents\Github\WinShellServ\ServerInstallFeatures.xml
#      C:\Downoalds\ServerInstallFeatures.xml

$ConfigurationFilePath = ""
Install-WindowsFeature -ConfigurationFilePath $ConfigurationFilePath
