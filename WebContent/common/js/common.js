var CountDownClock=(function(window,undefined){
	var Constructor=function(e,overTime){
		this.ui=this._getElement(e);
		this.timeoutIndex=0;
		this.overTime=overTime;
		
		/**
		 * 0=未启动
		 * 1=正执行
		 * 2=已完毕
		 * */
		this.statu=0;
		this._init();
	};
	Constructor.prototype={
		_getElement:function(e){
			var target=e;
			if(typeof e==="string"){
				target=window.document.getElementById(e);
			}
			return target;
			
			
		},
		_init:function(){
			var target=this.ui;
			if(!(target instanceof HTMLElement)){
				throw new Error(e+"必须的dom节点");	
			}
			var overTime=this.overTime;
			if(!(overTime instanceof Date)){
				throw new Error(overTime+"必须是Date对象");
			}
			
		}
	
		
	};
	var fillPrefix0=function(s,limit){
		var prefix0="";
		s=String(s);
		for(var i=s.length;i<limit;i++){
			prefix0+="0";
		}
		return prefix0+s;
	};
	Constructor.prototype.start=function(){
		if(this.statu!==0)return;//已启动或关闭
		var that=this;
		this.statu=1;
		var run=function(){
				var now=new Date().getTime();
				var over=that.overTime.getTime();
				var leftTotal=over-now;
				if(leftTotal<=0){
					that.statu=2;
					return;
				}
				
				var view=that.ui;
				leftTotal=(leftTotal-leftTotal%1000)/1000;//剩余秒
				var leftS=leftTotal%60;
				leftTotal=(leftTotal-leftS)/60;//剩余分
				var leftM=leftTotal%60;
				leftTotal=(leftTotal-leftM)/60;//剩余小时
				var leftH=leftTotal%24;
				leftTotal=(leftTotal-leftH)/24;//剩余天
				var leftDay=leftTotal;
			
				
				view.innerHTML=leftDay+"天"+fillPrefix0(leftH,2)
				+"小时"+fillPrefix0(leftM,2)+"分钟"+fillPrefix0(leftS,2)+"秒";
				
				setTimeout(run,1);
			};
			this.timeoutIndex=setTimeout(run,1);
	};
	return Constructor;
})(window);

