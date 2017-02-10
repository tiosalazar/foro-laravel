<template>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="box box-primary tarea">
        <div class="box-header with-border">
          <h3 class="box-title">ver Tarea</h3>
        </div>
        <!-- /.box-header -->
       
      </div>
    </div>
  </div>
</template>
<script>
	module.exports = {
    props: ['arraytarea'],
    data(){
      return{
        
      }
    },
    created: function() {
      if (this.arraytarea!=undefined) {
           
          console.log(this.arraytarea);
          var obj = JSON.parse(this.arraytarea);
          console.log(obj);           

    }

  }
}
  
</script>