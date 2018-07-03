import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

HDrawablePool pool;
HColorPool colors;

int     renderNum  = 18;
String  renderPATH = "render/";

void setup(){
	size(1920,1080);
	H.init(this).background(#202020);
	smooth();

	// colors = new HColorPool(#6699cc, #fff275, #ff8c42, #ff3c38, #a23e48);
	colors = new HColorPool(#f46036, #2e294e, #1b998b, #e71d36, #c5d86d);
	// colors = new HColorPool(#220901, #621708, #941b0c, #bc3908, #f6aa1c);

	pool = new HDrawablePool(798);
	pool.autoAddToStage()

		// .add(new HShape("svg3.svg"))
		.add(new HShape("svg3.svg"))
		// .add(new HShape("svg2.svg"))

		.layout(
			new HGridLayout()
				.startX(35)
				.startY(40)
				.spacing(50, 50)
				.cols(38)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj){
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)   
						.strokeCap(ROUND)   
						.strokeWeight(0)
						.stroke(#000000)
						.anchorAt(H.CENTER)
						.rotate( (int)random(4)*90 )
						// .size( 50 + ((int)random(2)*50) )
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
	save(renderPATH + renderNum + ".png");
}
