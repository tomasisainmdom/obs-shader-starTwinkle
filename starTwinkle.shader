// Twinkling Stars Shader for Exeldro obs-shaderfilter

// ------------------------------------------------------
// Plugin-style Uniform Declarations (with angle brackets)
// ------------------------------------------------------

uniform float brightness_threshold<
    string label = "Brightness Threshold";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 1.0;
    float step = 0.01;
> = 0.3;

uniform float flicker_speed<
    string label = "Flicker Speed";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 20.0;
    float step = 0.1;
> = 5.0;

uniform float flicker_base<
    string label = "Flicker Base";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 2.0;
    float step = 0.01;
> = 0.8;

uniform float flicker_variation<
    string label = "Flicker Variation";
    string widget_type = "slider";
    float minimum = 0.0;
    float maximum = 2.0;
    float step = 0.01;
> = 0.2;

// ------------------------------------------------------
// A pseudo-random function for per-pixel variation
// ------------------------------------------------------
float random(float2 st) {
    return frac(sin(dot(st, float2(12.9898, 78.233))) * 43758.5453123);
}

// ------------------------------------------------------
// Main shader function for obs-shaderfilter
// ------------------------------------------------------
float4 mainImage(VertData v_in) : TARGET
{
    // Sample the source image at this pixel
    float4 color = image.Sample(textureSampler, v_in.uv);

    // Calculate perceived brightness (luminance)
    float brightness = dot(color.rgb, float3(0.299, 0.587, 0.114));

    // Only flicker pixels above the threshold (i.e. "stars")
    if (brightness > brightness_threshold)
    {
        // Use 'elapsed_time' (provided by the plugin) + random offset for each pixel
        float flicker = flicker_base 
            + flicker_variation 
              * sin(elapsed_time * flicker_speed + random(v_in.uv) * 10.0);

        // Apply flicker to the star color
        color.rgb *= flicker;
    }

    return color;
}
