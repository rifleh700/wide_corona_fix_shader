
texture gTexture0 < string textureState="0,Texture"; >;

float2 fViewportSize;

sampler Sampler0 = sampler_state {
	Texture = (gTexture0);
	AddressU = BORDER;
	AddressV = BORDER;
	BorderColor = 0;
};

struct PSInput {
	float4 Diffuse : COLOR0;
	float2 TexCoord : TEXCOORD0;
};

float ScaleCoord(float coord, float factor) {

	float offset = (1 - factor)/2;
	return (coord - offset) / factor;
}

float4 PixelShaderFunction(PSInput PS) : COLOR {

	//fix ratio
	PS.TexCoord.x = ScaleCoord(PS.TexCoord.x, fViewportSize.y / fViewportSize.x);

	return saturate(tex2D(Sampler0, PS.TexCoord.xy) * PS.Diffuse);
}


technique main {
	pass P0 {
		PixelShader = compile ps_2_0 PixelShaderFunction();
	}
}