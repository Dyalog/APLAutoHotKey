# Inject patch number into version
$majmin=cat "APLSource/version.apla"
$patch=git rev-list --count HEAD
$version=$majmin.replace('DEVELOPMENT',$patch)
echo $version | Out-File "APLSource/version.apla"
echo "Building workspace for APLAutoHotKey v$version"
# Build workspace
$env:LOAD = 'CI/Build.aplf'; &"C:\Program Files\Dyalog\Dyalog APL-64 18.2 Unicode\dyalog.exe"
# Publish draft release
