param(
     [string] $resource_group_name,
     [string] $webapp_name,
     [string] $container_url,
	   [string] $frequency_int,
     [string] $frequency_unit,
		 [string] $utcValue,
		 [string] $retention_day
     )
Edit-AzWebAppBackupConfiguration -ResourceGroupName $resource_group_name -Name $webapp_name -StorageAccountUrl $container_url -FrequencyInterval $frequency_int -FrequencyUnit $frequency_unit -StartTime $utcValue -RetentionPeriodInDays $retention_day
