<#
.SYNOPSIS
Queries all the resources within your subscription and displays the tags

.DESCRIPTION 
This small script queries all the resources within your subscription, the displays the Resource Type, Resource Name and then lists what, if any Tags that the resource has attached to it.  It only displays the high level Tag not the value. 

.OUTPUTS


.NOTES
Written by: Sarah Lean

Find me on:

* My Blog:	http://www.techielass.com
* Twitter:	https://twitter.com/techielass
* LinkedIn:	http://uk.linkedin.com/in/sazlean
* GitHub:   https://www.github.com/weeyin83


.EXAMPLE


Change Log
V1.00, 03/05/2018 - Initial version

License:

The MIT License (MIT)

Copyright (c) 2017 Sarah Lean

Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the "Software"), to deal 
in the Software without restriction, including without limitation the rights 
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
copies of the Software, and to permit persons to whom the Software is 
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
DEALINGS IN THE SOFTWARE.

#>


#Queries for all Microsoft Resources in your subscription
$resources = Get-AzureRMResource | Where-Object {$_.ResourceType -like "Microsoft*"} |

foreach {

    new-object -TypeName psobject -Property @{
        ResourceName = $_.ResourceName;
        ResourceType = $_.ResourceType;
        Tag          = $_.Tags

    }
}


#Displays the results of the above query
$resources | Format-Table

