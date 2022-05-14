# Most functions taken directly from https://github.com/kajott/CompoKit/blob/master/bin/setup.ps1


$basedir = Get-Location
$installdir = Join-Path $basedir "OBS_APP"

$urls = @(
    "https://github.com/obsproject/obs-studio/releases/download/27.2.4/OBS-Studio-27.2.4-Full-x64.zip"
    "https://github.com/Palakis/obs-ndi/releases/download/4.9.1/obs-ndi-4.9.0-Windows.zip"
    "https://github.com/layeh/obs-active-scene-dock/releases/download/v0.1.2/active-scene-dock-0.1.2-windows.zip"
)


# split a URL into a (URL, filename) tuple
function parse_url($url) {
    # check for filename override
    $parts = $url.split("|")
    if ($parts.Count -gt 1) {
        $url = $parts[0]
        $filename = $parts[-1]
    }
    elseif ($url.ToLower().EndsWith("/download")) {
        # SourceForge-style URL that ends with "/download"
        $filename = $url.Split("/")[-2]
    }
    else {
        # normal URL
        $filename = $url.Split("?")[0].Split("#")[0].Trim("/").Split("/")[-1]
    }
    return @($url, $filename)
}

# download a file into the temp directory and return its path
function download($url) {
    $url, $filename = parse_url $url
    $filename = Join-Path $basedir $filename
    Write-Host $filename
        try {
            (New-Object System.Net.WebClient).DownloadFile($url, $filename)
        }
        catch {
            error ("failed to download " + $url + "`n(this may cause some subsequent errors, which may be ignored)")
            return ""
        }
        
    
    return $filename
}

function extract($archive) {
    Expand-Archive -Path $archive -DestinationPath $installdir
    return $archive
}

New-Item -ItemType Directory $installdir
foreach($u in $urls) {
    Remove-Item (extract (download $u)) 
    
}

Copy-Item (Join-Path $basedir "obs/config") (Join-Path $installdir "config") -Recurse
Copy-Item (Join-Path $basedir "assets") "C:\Users\Public\Documents\OBS_Assets" -Recurse
New-Item (Join-Path $installdir "portable_mode.txt")

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut((Join-Path $installdir "OBS.lnk"))
$Shortcut.TargetPath = (Join-Path $installdir "bin/64bit/obs64.exe")
$Shortcut.Save()
