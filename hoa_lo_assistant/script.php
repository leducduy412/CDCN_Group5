<?php 
	if(isset($_POST['submit'])){
		$data = $_POST;
		$file = $_GET['file'];
		foreach ($data as $key => $input) {
			if($key != "submit"){
				$json_data = file_get_contents("assets/database/{$file}");
				$dec_data = json_decode($json_data, true);
				foreach ($dec_data as $field => $value) {
					if($key == $field){
						$dec_data[$key] = trim($input);
					}
				}
			}
		}

		$enc_data = json_encode($dec_data, JSON_PRETTY_PRINT);
		file_put_contents("assets/database/{$file}", $enc_data);
	}