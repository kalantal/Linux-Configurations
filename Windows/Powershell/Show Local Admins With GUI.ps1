#This gets the group information in a function call used by two other functions
function getComputerGroup 
{ param($strComputer, $strGroup) 
$computer = [ADSI]("WinNT://" + $strComputer + ",computer") 
$Group = $computer.psbase.children.find($strGroup) 
return $Group 
}
# This will list what’s currently in a Group so you can verify the result 
function listUsers 
{ param($strComputer, $strGroup) 
$returnGroup = getComputerGroup -strComputer $strComputer -strGroup $strGroup 
$members= $returnGroup.psbase.invoke("Members") | %{$_.GetType().InvokeMember("Adspath", ' 
GetProperty', $null, $_, $null)} 

#$members |Out-GridView -Title ($strComputer +" "+ $strGroup) 
$richTextBox1.Clear() 
foreach ($line in $members) { 
$richTextBox1.Appendtext($line+[char]13+[char]10) 
} 
} 
#function to add a user to the affected machine group 
function Add-User 
{ param($strComputer, $strGroup, $strUser) 
$returnGroup = getComputerGroup -strComputer $strComputer -strGroup $strGroup 
$tempvar ="WinNT://"+$strUser+",group" 
$returnGroup.Add($tempvar) 
} 
#function to delete a user to the affected/machine/group 
function Del-User 
{ 
param($strComputer, $strGroup, $strUser) 
$returnGroup = getComputerGroup -strComputer $strComputer -strGroup $strGroup 
$tempvar ="WinNT://"+$strUser+",group" 
$returnGroup.Remove($tempvar) 
} 

# Load the Winforms assembly 
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms") | Out-Null 

# Create the form 
$form = New-Object Windows.Forms.Form
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Width = 360 
$System_Drawing_Size.Height = 360 
$form.ClientSize = $System_Drawing_Size 
$form.BackColor = [System.Drawing.Color]::FromArgb(255,185,209,234) 
$form.StartPosition = 1 

#Set the dialog title 
$form.text = "Group Membership Tool" 

# Create the label control and set text, size and location 
$svrLabel = New-Object Windows.Forms.Label 
$svrLabel.Location = New-Object Drawing.Point 36,15 
$svrLabel.Size = New-Object Drawing.Point 210,15 
$svrLabel.text = "Computername" 
$svrLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8,0,3,0) 

$grplabel = New-Object Windows.Forms.Label 
$grplabel.Location = New-Object Drawing.Point 36,56 
$grplabel.Size = New-Object Drawing.Point 210,15 
$grplabel.text = "GroupName" 
$grplabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8,0,3,0) 

$userlabel = new-object windows.forms.label 
$userlabel.Location = New-Object Drawing.Point 36,102 
$userlabel.Size = New-Object Drawing.Point 375,15 
$userlabel.text = "Username" 
$userlabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8,0,3,0) 

$statusBar1 = New-Object System.Windows.Forms.StatusBar 
$statusBar1.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Point = New-Object System.Drawing.Point 
$System_Drawing_Point.X = 0 
$System_Drawing_Point.Y = 280 
$statusBar1.Location = $System_Drawing_Point 
$statusBar1.Name = "statusBar1" 
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Height = 22 
$System_Drawing_Size.Width = 480 
$statusBar1.Size = $System_Drawing_Size 
$statusBar1.TabIndex = 12 
$statusBar1.Text = "Status" 

$svrtext = New-Object Windows.Forms.TextBox 
$svrtext.Location = New-Object Drawing.Point 40,30 
$svrtext.Size = New-Object Drawing.Point 204,15 
$svrtext.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,0) 
$svrtext.text = "localhost" 
$svrtext.TabIndex = 1 
#$svrtext.UseWaitCursor = $True 
#$svrtext.Focus()
$comboBox1 = New-Object System.Windows.Forms.ComboBox 
$comboBox1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,0) 
$comboBox1.DataBindings.DefaultDataSourceUpdateMode = 0 
$comboBox1.FormattingEnabled = $True 
$comboBox1.text = "Administrators" 
$comboBox1.Items.Add("Administrators")|Out-Null 
$comboBox1.Items.Add("Backup Operators")|Out-Null 
$comboBox1.Items.Add("Debugger Users")|Out-Null 
$comboBox1.Items.Add("Power Users")|Out-Null 
$comboBox1.Items.Add("Print Operators")|Out-Null 
$comboBox1.Items.Add("Remote Desktop Users")|Out-Null 
$comboBox1.Items.Add("Replicator")|Out-Null 
$comboBox1.Items.Add("Users")|Out-Null 
$System_Drawing_Point = New-Object System.Drawing.Point 
$System_Drawing_Point.X = 40 
$System_Drawing_Point.Y = 72 
$comboBox1.Location = $System_Drawing_Point 
$comboBox1.Name = "comboBox1" 
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Height = 15 
$System_Drawing_Size.Width = 204 
$comboBox1.Size = $System_Drawing_Size 
$comboBox1.Sorted = $True 
$comboBox1.TabIndex = 2 

$usertext = New-Object Windows.Forms.TextBox 
$usertext.Location = New-Object Drawing.Point 40,119 
$usertext.Size = New-Object Drawing.Point 204,15 
$usertext.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,0) 
$usertext.text = "" 
$usertext.TabIndex = 3
#Region Richtextbox 1 
$richTextBox1 = New-Object System.Windows.Forms.RichTextBox 
$richTextBox1.Anchor = 15 
$richTextBox1.DataBindings.DefaultDataSourceUpdateMode = 0 
$System_Drawing_Point = New-Object System.Drawing.Point 
$System_Drawing_Point.X = 15 
$System_Drawing_Point.Y = 190 
$richTextBox1.Location = $System_Drawing_Point 
$richTextBox1.Name = "richTextBox1" 
$richTextBox1.Font = New-Object System.Drawing.Font("Courier New",8,1,3,0) 
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Height = 140 
$System_Drawing_Size.Width = 330 
$richTextBox1.Size = $System_Drawing_Size 
$richTextBox1.TabIndex = 0 
$richTextBox1.Text = "" 
$form.Controls.Add($richTextBox1) 
#EndRegion

# Create Button and set text and location 
$button = New-Object Windows.Forms.Button 
$button.text = "GO" 
$button.Location = New-Object Drawing.Point 260,50 
$button.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,0) 
$button.TabIndex = 7 

$button1 = New-Object Windows.Forms.Button 
$button1.text = "PING" 
$button1.Location = New-Object Drawing.Point 260,100 
$button1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,0) 
$button1.TabIndex = 7
$rdoAdd = New-Object Windows.forms.RadioButton 
$rdoAdd.text = "Add Member" 
$rdoAdd.height = 50 
$rdoAdd.width = 100 
$rdoAdd.top=148 
$rdoAdd.left =28 
$rdoAdd.TabIndex = 5 

$rdoDel = New-Object Windows.forms.RadioButton 
$rdoDel.text = "Remove Member" 
$rdoDel.height = 50 
$rdoDel.width = 100 
$rdoDel.top=148 
$rdoDel.left =130 
$rdoDel.TabIndex = 6
$rdoLst = New-Object Windows.forms.RadioButton 
$rdoLst.text = "List Members" 
$rdoLst.height = 50 
$rdoLst.width = 160 
$rdoLst.top=148 
$rdoLst.left =230 
$rdoLst.Checked = $True 
$rdoLst.TabIndex = 4
# Set up event handler to extarct text from TextBox and display it on the Label. 
$button.add_click({ 
$strComputer = $svrtext.text 
$strgroup = $comboBox1.text 
$username = $usertext.text 
if($rdoAdd.checked) 
{$status = "Added " 
Add-User -strComputer $strComputer -strGroup $strgroup -strUser $username 
$statusBar1.Text = $status + " " + $usertext.text + " on " + $svrtext.text +" to " + $comboBox1.text + " group " 
}
elseif($rdoLst.checked) 
{$status = "List all users" 
listUsers -strComputer $strComputer -strGroup $strgroup -strUser $username 
$statusBar1.Text = $status + " " + $usertext.text + " on " + $svrtext.text +" in " + $comboBox1.text + " group " 
} 
elseif($rdoDel.checked) 
{$status = "Removed " 
Del-User -strComputer $strComputer -strGroup $strgroup -strUser $username 
$statusBar1.Text = $status + " " + $usertext.text + " on " + $svrtext.text +" from " + $comboBox1.text + " group " 
} 
}) 
$button1.add_click({ 
$strComputer = $svrtext.text 
$strgroup = $comboBox1.text 
$username = $usertext.text 
$richTextBox1.Clear() 
ping -n 5 $strComputer | out-string -Stream | foreach-object { 
$richTextBox1.lines = $richTextBox1.lines + $_ 
$richTextBox1.Select($richTextBox1.Text.Length, 0) 
$richTextBox1.ScrollToCaret() 
$form.Update()} 
})
# Add the controls to the Form 
$form.controls.add($button) 
$form.controls.add($button1) 
$form.controls.add($svrlabel) 
$form.controls.add($svrtext) 
$form.controls.add($grplabel) 
$form.controls.add($comboBox1) 
$form.controls.add($userlabel) 
$form.controls.add($usertext) 
$form.controls.add($rdoAdd) 
$form.controls.add($rdoDel) 
$form.controls.add($rdoLst) 
#$form.controls.add($dbglabel) 
$form.controls.add($statusBar1)
# Display the dialog 
$form.ShowDialog()