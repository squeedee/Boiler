package boiler.demos.googlemaps.model.constants
{
	public class ApplicationConstants
	{
		static public const GMAPS_API_KEY : String = "ABQIAAAAO-cCleAenkHS3l5YIe2rfxSt3J1WxB__3gt1bNGcz4st1p409RRCt9eMECH2W2XImEESSkQKpJMumg";
		
		static public const MARKERS_XML : XML =	<markers>
			<marker headline="In de Wildeman, a famous beerpub" foto="wild.jpg" body="Situated in a former Amsterdam distillery, In de Wildeman offers an ideal opportunity to enjoy your beer in an authentic environment." lat="52.3761799" lng="4.8952004" stad="Amsterdam" adres="Kolksteeg 3"/>
			<marker headline="Café Jos Meesterschenkerij" foto="jos.jpg" body="This pub is the 2009 number 1 pub in The Netherlands according to the official pub top 100! Be sure to visit this one." lat="51.8359761" lng="5.8781757" stad="Nijmegen" adres="Daalseweg 309"/>
		</markers>;
		
		public function ApplicationConstants()
		{
			throw new Error( this, 'static class, no instantiation allowed' );
		}
	}
}