$imgurURL = Read-Host -Prompt "Enter the URL of the IMGUR album: "
$page = Invoke-WebRequest -Uri $imgurURL -UseBasicParsing
if((Test-Path ".\Images") -eq $False){
    mkdir ".\Images"
}
foreach($image in $page.Images){
    if($image.itemprop -eq "contentURL"){
	    echo ([string]"Downloading image " + [string]$page.Images.IndexOf($image))
	    $image_url = $image.src.replace("//", "http://")
	    $image_name = $image.src.Substring(14)
	    Invoke-WebRequest -Uri $image_url -OutFile ".\Images\$image_name" -UseBasicParsing

    }
}
