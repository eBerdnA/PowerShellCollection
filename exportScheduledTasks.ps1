$sch = New-Object -ComObject("Schedule.Service")
$sch.Connect("localhost")
$tasks = $sch.GetFolder("\").GetTasks(0)
 
$outfile_temp = "C:\PoSh\Save_ScheduledTasks\{0}.xml";
 
$tasks | %{
    $xml = $_.Xml
    $task_name = $_.Name
    $outfile = $outfile_temp -f $task_name
    $xml | Out-File $outfile 
}