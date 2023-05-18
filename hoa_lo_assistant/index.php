<?php include "script.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <link rel="stylesheet" href="styles.css">
	<title>Edit JSON files with php</title>
</head>
<body>


<div class="page">
	<div class="files">
		<div class="title">Json files</div>
		<?php 
			$files = glob("assets/database/*.json");
			foreach ($files as $value) {
				$value = basename($value);
				?>
					<a href="?file=<?php echo $value ?>">
						<?php echo $value ?>
					</a>
				<?php
			}
		 ?>
	</div>
	<script>
    	function addImageField(key) {
			var container = document.querySelector('.edit-product');
			var imageCount = document.querySelectorAll('input[name="' + key + '_new"]').length;
			var newImageField = document.createElement('div');
			newImageField.innerHTML = `
				<img src="" alt="New Image">
				<input type="file" name="${key}[${imageCount}]_new">
			`;
			container.insertBefore(newImageField, container.lastElementChild);
    	}
	</script>
	<div class="edit-product">
		<div class="title">Edit properties in - <span><?php echo @$_GET['file'] ?></span> </div>
		<?php 
			if(isset($_GET['file'])){
				$file = $_GET['file'];
				$file = file_get_contents("assets/database/{$file}");
				$enc_file = json_decode($file, true);
				foreach ($enc_file as $key => $value) {
					?>
					<form action="?<?php echo $_SERVER['QUERY_STRING']?>" method="POST" autocomplete="off">
						<label><?php echo $key ?></label>
						<?php
						if ($key === 'icon') {
							?>
							<img src="<?php echo $value ?>" alt="Icon">
							<?php
						} elseif ($key === 'images' && is_array($value) && isset($value['image'])) {
							?>
							<label><?php echo $key ?></label>
							<?php
							foreach ($value['image'] as $image) {
								?>
								<img src="<?php echo $image ?>" alt="Image">
								<?php
							}
							if (isset($value['additional_text'])) {
								?>
								<textarea name="additional_text"><?php echo $value['additional_text'] ?></textarea>
								<?php
							}
						} elseif ($key === 'videos' && is_array($value) && isset($value['video']) && isset($value['title']) && isset($value['text'])) {
							?>
							<video controls>
								<source src="<?php echo $value['video'] ?>" type="video/mp4">
							</video>
							<input type="text" name="title" value="<?php echo htmlspecialchars($value['title']) ?>">
							<textarea name="text"><?php echo $value['text'] ?></textarea>
							<?php
						} else {
							?>
							<input type="text" name="<?php echo $key ?>" value="<?php echo htmlspecialchars($value) ?>">
							<?php
						}
						?>
						<button type="submit" name="submit" value="save">Save</button>
					</form>
					<?php
				}
						
				
				
				
			}
		?>
	</div>
</div>
</body>
</html>