#version 120

uniform sampler2D texture;
uniform sampler2D lightmap;

varying vec2 texcoord;
varying vec2 lightmapCoord;
varying vec4 vertexColor;

/* RENDERTARGETS: 0 */

void main() {
    vec4 albedo = texture2D(texture, texcoord) * vertexColor;

    if (albedo.a < 0.1) {
        discard;
    }

    vec3 lightmapColor = texture2D(lightmap, lightmapCoord).rgb;

    // Level 1 hand pass: apply basic Minecraft lightmap so handheld items
    // are not rendered as flat full-bright objects.
    albedo.rgb *= lightmapColor;

    gl_FragData[0] = albedo;
}
