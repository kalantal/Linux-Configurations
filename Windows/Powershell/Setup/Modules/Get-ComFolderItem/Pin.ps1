$PinnedItems = @(
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    "C:\Windows\Explorer.exe"
	"C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe"
)

# Removing each item and adding it again results in an idempotent ordering
# of the items. If order doesn't matter, there is no need to uninstall the
# item first.
foreach($Item in $PinnedItems) {
    #Uninstall-TaskBarPinnedItem -Item $Item
    Install-TaskBarPinnedItem   -Item $Item
}