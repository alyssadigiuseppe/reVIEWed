<?php
	function getAll($tbl) {
		include('connect.php');
		$queryAll = "SELECT * FROM {$tbl}";
		$runAll = mysqli_query($link, $queryAll);

		if($runAll){
			return $runAll;
		}else{
			$error =  "There was an error accessing this information.";
			return $error;
		}
	}

	function getSingleCol($tbl, $col) {
		include('connect.php');
		$queryAll = "SELECT {$col} FROM {$tbl}";
		$runAll = mysqli_query($link, $queryAll);

		if($runAll){
			return $runAll;
		}else{
			$error =  "There was an error accessing this information.";
			return $error;
		}
	}

	function getSingle($tbl, $col, $id) {
		include('connect.php');
		$querySingle = "SELECT * FROM {$tbl} WHERE {$col}='{$id}'";
		$runSingle = mysqli_query($link, $querySingle);

		if($runSingle){
			return $runSingle;
		}else{
			$error =  "There was an error accessing this information.";
			return $error;
		}
	}

	function getSingleLike($tbl, $col, $id) {
		include('connect.php');
		$querySingle = "SELECT * FROM {$tbl} WHERE {$col} LIKE '%{$id}%'";
		$runSingle = mysqli_query($link, $querySingle);

		if($runSingle){
			return $runSingle;
		}else{
			$error =  "There was an error accessing this information.";
			return $error;
		}
	}

	function filterType($tbl1, $tbl2, $tbl3, $col1, $col2, $col3, $filter) {
		include('connect.php');
		$queryFilter = "SELECT * FROM {$tbl1}, {$tbl2}, {$tbl3} WHERE {$tbl1}.{$col1} = {$tbl3}.{$col1} AND {$tbl2}.{$col2} = {$tbl3}.{$col2} AND {$tbl2}.{$col3} = '{$filter}'";
		//echo $queryFilter;
		$runFilter = mysqli_query($link, $queryFilter);

		if($runFilter){
			return $runFilter;
		}else{
			$error =  "There was an error accessing this information.";
			return $error;
		}

	}
?>
