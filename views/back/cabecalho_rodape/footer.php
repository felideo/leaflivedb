    </div>
	<script type="text/javascript">
	    <?php
	        if(isset($_SESSION['alertas'])) {
	            echo $_SESSION['alertas'];
	        }
	    ?>

	    $(window).load(function(){
	    	limpar_alertas_ajax();
	    });

	</script>
</body>


</html>
