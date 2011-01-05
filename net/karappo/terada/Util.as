package net.karappo.terada 
{
	/**
	 * よく使う静的な関数群
	 * 
	 * @author TERADA naokazu (terada@karappo.net)
	 */
	
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	
	public class Util
	{
		// トレースのときに使う共通接頭語
		private static var _TAG:String = "--[TERA Util]--"
		
		//　すべての個要素をトレース
		public static function dumpChildren( _container:DisplayObjectContainer )
		{
			var TAG:String = _TAG + "< dumpChildren >";
			
			var _num = _container.numChildren;
			if ( _num == 0 )
			{
				trace(TAG, _container+" には子がありません・・・");
			}
			else
			{
				trace(TAG, " target: " + _container);
				trace("------------------------------------");
				trace("");
				for (var i:int = _num-1; 0 <= i; i -- )
				{
					var obj = _container.getChildAt(i);
					if((obj != null)&&( obj.name != null )) trace(i + "  |  " + obj + "  (　name　： "+obj.name + " visible : "+obj.visible+" alpha : "+obj.alpha+" )");
					else 									trace(i + "  |  " + obj);
				}
				trace("");
				trace("------------------------------------");
			}
		}
		
		// 再帰的にすべての表示ツリーをトレース
		public static function dumpAllChildren( _container:DisplayObjectContainer, _hierarchy:uint = 0 )
		{
			var TAG:String = _TAG + "< dumpAllChildren >";
			
			var _num = _container.numChildren;
			if ( _num == 0 )
			{
				trace(TAG, _container+" には子がありません・・・");
			}
			else
			{
				if ( _hierarchy == 0)
				{
					trace(TAG, " target: " + _container);
					trace("====================================");
					trace("");
				}
				for (var i:int = _num-1; 0 <= i; i -- )
				{
					var obj = _container.getChildAt(i);
					if ((obj != null) && ( obj.name != null )) 
					{
						// 階層に合わせて空白部分を生成
						var prefix = "    ";
						for ( var j = 1; j < _hierarchy + 1; j++)
						{
							prefix += prefix;
						}
						
						trace(prefix + i + "  |  " + obj + "  (　name　： " + obj.name + " visible : " + obj.visible + " alpha : " + obj.alpha + " )");
						//var __num:Number = Number(  );
						if ((obj is DisplayObjectContainer ) && ( obj.numChildren ) )
						{
							dumpAllChildren( obj, _hierarchy+1 );
						}
					}
					else
					{
						trace(i + "  |  " + obj);
					}
				}
				if ( _hierarchy == 0)
				{
					trace("");
					trace("====================================");
				}
			}
			
			
		}
		
		//　すべての子供を削除
		public static function removeAllChildren( _container:DisplayObjectContainer )
		{
			var _num = _container.numChildren;
			for (var i:int = 0; i < _num; i ++ )
			{
				_container.removeChildAt(0);
			}
		}
		
		//　表示順を一番上に
		public static function swapTop( _mc:DisplayObjectContainer )
		{
			var __mc:DisplayObjectContainer 	= _mc;
			var __parent:DisplayObjectContainer = _mc.parent;
			__parent.setChildIndex( __mc, __parent.numChildren-1 );
		}
		
		
		
		
		
		
		
		// 引数が小数点以下に値をもつかどうか調べる
		public static function isInteger( __num:Number )
		{
			if (( __num - Math.floor(__num) ) == 0 ) 
			{
				// 整数
				return true;
			}
			else 
			{
				//　小数
				return false;
			}
		}
		
		//配列をランダムに並べ替えて返す
		static public function shuffleArray( array:Array ):Array {
			var l:int = array.length;
			while( l-- ) {
				var j:Number = Math.floor( Math.random() * ( l + 1 ) );
				var result = array[l];
				array[l] = array[j];
				array[j] = result;
			}
			return array;
		}
		
		
		// 「1」→「01」に変換
		public static function addZero(num:uint):String
		{
			return (num < 10) ? "0" + num : num.toString();
		}
		
		
		
		public function Util() 
		{
			
		}
	}

}