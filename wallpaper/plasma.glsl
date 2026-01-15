//!HOOK MAINPRESUB
//!BIND HOOKED
//!DESC Pixelated Color Flow - Film Noir Preset

float length2(vec2 v) {
    return sqrt(v.x * v.x + v.y * v.y);
}

vec3 getColor(float t, float blend) {
    // Film Noir preset colors
    vec3 col1 = vec3(0.35, 0.35, 0.35);
    vec3 col2 = vec3(0.0, 0.0, 0.0);
    vec3 col3 = vec3(0.0, 0.0, 0.0);
    
    // Use continuous value instead of floor for smooth transitions
    float continuous = mod(t, 12.0);
    
    vec3 result;
    if (continuous < 4.0) {
        result = col1;
    } else if (continuous < 8.0) {
        float frac = (continuous - 4.0) / 4.0;
        result = mix(col1, col2, frac);
    } else {
        float frac = (continuous - 8.0) / 4.0;
        result = mix(col2, col3, frac);
    }
    
    // Apply contrast/blend factor
    return mix(col1, result, blend);
}

vec4 hook() {
    // Film Noir preset settings
    float speed = 4.0;
    float complexity = 1.0;
    float contrast = 1.0;
    float pixelSize = 16.0;
    
    // Get time from frame counter
    float time = float(frame) * 0.016667 * speed;
    
    // Pixelation
    vec2 pixelCoord = floor(gl_FragCoord.xy / pixelSize) * pixelSize;
    
    // Convert to normalized coordinates
    vec2 resolution = vec2(HOOKED_size.x, HOOKED_size.y);
    vec2 uv = (pixelCoord * 2.0 - resolution) / resolution.y;
    
    // Subtle variation in pattern
    float t = time * 0.1;
    float patternCosMod = 1.14159 + sin(t * 0.1) * 0.5;
    float patternSinMod = 3.57079 + cos(t * 0.1) * 0.5;
    
    vec2 uv2 = vec2(uv.x + uv.y);
    
    // Iterative pattern generation with adjustable complexity
    for(int i = 0; i < 3; i++) {
        uv2 += uv + length2(uv);
        uv += 0.5 * vec2(
            cos(patternCosMod + uv2.y * 0.2 * complexity + t * 0.1),
            sin(patternSinMod + uv2.x * complexity - t * 0.1)
        );
        uv -= complexity * (cos(uv.x + uv.y) - sin(uv.x * 0.7 - uv.y));
    }
    
    float dist = length2(uv);
    
    // Use sin wave for continuous wrapping instead of linear jumps
    float wave = sin(dist * (3.0 + complexity)) * 0.5 + 0.5;
    float colorIndex = wave * 8.0;
    
    vec3 col = getColor(colorIndex, contrast);
    
    // Subtle vignette for depth
    float vignette = 1.0 - length(gl_FragCoord.xy / resolution - 0.5) * 0.3;
    col *= vignette;
    
    return vec4(col, 1.0);
}
