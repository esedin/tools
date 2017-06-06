Set-Alias npp "C:\Program Files\npp\notepad++.exe"

$CSF_TRUNK_DIR = "c:\SandBox\trunk"

function delr($x) 
{
   get-childitem . -include $x -recurse | foreach ($_) {remove-item $_.fullname -ErrorAction SilentlyContinue -force -recurse}
}

function opom 
{
   invoke-expression -command "npp .\pom.xml"
}

Set-Alias jbci jboss_clean_install

function jboss_clean_install
{
   cd $CSF_TRUNK_DIR
   mvn "-Dcsf.container=jboss" clean install "-DskipTests=true"
}

Set-Alias wlci weblogic_clean_install

function weblogic_clean_install
{
   mvn "-Dcsf.container=weblogic" clean install "-DskipTests=true"
}

function sandbox
{
   invoke-expression -command "cd c:\SandBox\trunk"
}

function update
{
   cd $CSF_TRUNK_DIR
   svn update
}

function AdsLargeIntegerToIn64($adsLargeInteger)
{
 [Int32]$highPart = $adsLargeInteger.GetType().InvokeMember("HighPart", [System.Reflection.BindingFlags]::GetProperty, $null, $adsLargeInteger, $null)
 [Int32]$lowPart  = $adsLargeInteger.GetType().InvokeMember("LowPart",  [System.Reflection.BindingFlags]::GetProperty, $null, $adsLargeInteger, $null)
 return  [Int64]("0x{0:x8}{1:x8}" -f $highPart, $lowpart)
}

function getNews
{
 $HTML = Invoke-WebRequest -Uri "http://www.unian.net"
 $news = $HTML.ParsedHtml.getElementsByTagName('ul') | where classname -eq 'main_all_news'
 $newsText = $news.getElementsByTagName('a') | select innerText
 write-host "`n"
 C:\Users\esed\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1$newsText | foreach{ $newsstr = $_.innerText; if ($newsstr){$newsstr.Insert(5, " ")}}
 write-host "`n"
}