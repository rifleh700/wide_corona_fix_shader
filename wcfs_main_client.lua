local SCREEN_WIDTH, SCREEN_HEIGHT = guiGetScreenSize()

local TEXTURE_NAMES = {
	"coronamoon",
	"coronastar",
	"coronaheadlightline",
}

local shader = dxCreateShader("corona.fx", 0, nil, nil, "world")
for i, name in ipairs(TEXTURE_NAMES) do
	engineApplyShaderToWorldTexture(shader, name)
end
dxSetShaderValue(shader, "fViewportSize", SCREEN_WIDTH, SCREEN_HEIGHT)