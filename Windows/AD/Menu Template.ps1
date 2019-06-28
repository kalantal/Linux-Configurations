function mainMenu()
{
	Clear-Host;
	Write-Host "============";
	Write-Host "= MAINMENU =";
	Write-Host "============";
	Write-Host "1. Press '1' for this option";
	Write-Host "2. Press '2' for this option";
	Write-Host "3. Press '3' for this option";
	Write-Host "4. Press '4' for this option";
}
 
function returnMenu($option)
{
	Clear-Host;
	Write-Host "You chose option $option";
	Write-Host "Press any key to return to the main menu.";
	$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
}
 
do
{
	mainMenu;
	$input = Read-Host "Enter a number for an option or type `"quit`" to finish."
	switch ($input)
	{
		"1"
		{
			returnMenu $input;
		}
		"2"
		{
			returnMenu $input;
		}
		"3"
		{
			returnMenu $input;		
		}
		"4"
		{
			returnMenu $input;		
		}
		"quit"
		{
			# nothing
		}
		default
		{
			Clear-Host;
			Write-Host "Invalid input. Please enter a valid option. Press any key to continue.";
			$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
		}
	}
 
} until ($input -eq "quit");
 
Clear-Host;