<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="claudiordev.springboot.conversions.Controllers"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- BootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Page CSS -->
<link rel="stylesheet" href="index.css" />
<meta charset="ISO-8859-1">
<title>Converter</title>
</head>
<body>

	<div id="intToRomanDiv" class="formConversionDiv">
		<!-- Title -->
		<div style="text-align:center;">
			<h4>Integer to Roman Conversion</h4>
		</div>
		<!-- Title -->
		
		<form action="intToRoman" method="post" style="padding:30px;">
			<div class="form-row">
				<div class="form-group col-md-8">
					<label>Integer Value: </label><input class="form-control" type="number" min="1" max="3999" id="integerValue" name="integerValue"/>
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-8">
					<label>Roman Value:</label> ${romanConvertedValue}
				</div>
			</div>
			
			<input id="intConverter" class="btn btn-primary" type="submit" value="Convert"/>
		</form>
	</div>
	
	<div id="romanToIntDiv" class="formConversionDiv">
		<!-- Title -->
		<div style="text-align:center;">
			<h4>Roman to Integer Conversion</h4>
		</div>
		<!-- Title -->
		
		<form action="romanToInt" method="post" style="padding:30px;">
			<div class="form-row">
				<div class="form-group col-md-8">
					<label>Roman Value: </label><input class="form-control" type="text" id="romanValue" name="romanValue"/>
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-8">
					<label>Integer Value:</label> ${integerConvertedValue}
				</div>
			</div>
			
			<input id="romanConverter" class="btn btn-primary" type="submit" value="Convert"/>
		</form>
	</div>
	
	<script>
		//Integer to Roman Validation
		$('#intConverter').on('click', function(e) {
			if ($('#integerValue').val() == "") {
				
				//CSS Error
				showError(1);
				
				alert('This field cannot be empty!');
				
				return false;
			} else {
				
				if($('#integerValue').val() >= 4000 || $('#integerValue').val() <= 0) {
					//Max value detect
					if ($('#integerValue').val() >= 4000) {
						//CSS Error
						showError(1);
						
						alert('The value cannot be greater than 3999!');
					}
					
					//Minimal value detect
					if($('#integerValue').val() <= 0) {
						//CSS Error
						showError(1);
						
						alert('The value cannot be smaller than 1!');
					}
					
				} else {
					
					//Clear CSS Error
					showError(2);
				}
				
				
				
			}
		});
		
		//Roman to Integer Conversion
		$('#romanConverter').on('click',function() {
			if ($('#romanValue').val() == "") {
				
				//CSS Error
				showError(3);
				
				alert('This field cannot be empty!');
				
				return false;
			} else {
				showError(4);
			}
		});
		
		/**
			Disable non roman characters to be used in the input
		**/
		var enabledValues = "IVXLCDM";
		
		$('#romanValue').keypress(function(e){
			if (enabledValues.indexOf(String.fromCharCode(e.which)) < 0) {
				return false;
			}
		});
		
		/**
			type: Show CSS error on respective input or clear it;
		**/
		function showError(type) {
				switch(type) {
				case 1:
					$('#integerValue').css({
						"border":"1px solid red"
					});
					
					break;
				case 2:
					$('#integerValue').css({
						"border":"1px solid #ced4da"
					});
					
					break;
				case 3:
					$('#romanValue').css({
						"border":"1px solid red"
					});
					
					break;
				case 4:
					$('#romanValue').css({
						"border":"1px solid #ced4da"
					});
					
					break;
				}
		}
	</script>

</body>
</html>