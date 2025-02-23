# Star Twinkle Shader for OBS (obs-shaderfilter)

A simple shader to add a gentle twinkling/flicker effect to bright spots (e.g., stars) in an image or video source using [Exeldro’s obs-shaderfilter plugin](https://obsproject.com/forum/resources/obs-shaderfilter.1736/).

## Features

- **Brightness Threshold** – Control which pixels get treated as "stars."
- **Flicker Speed** – Adjust how fast the flicker animation cycles.
- **Base & Variation** – Set the baseline brightness multiplier and how much it fluctuates.

## Requirements

- [OBS Studio](https://obsproject.com/)
- [obs-shaderfilter by Exeldro](https://obsproject.com/forum/resources/obs-shaderfilter.1736/) (version compatible with your OS)

## Installation

1. Download the `starTwinkle.shader` file.
2. In OBS, install the obs-shaderfilter plugin (if you haven’t already).
3. Add your starfield or night-sky image as a source in OBS.
4. Right-click the source → **Filters** → **+** → **User-defined Shader**.
5. Under **Shader text file**, browse and select `starTwinkle.shader`.
6. Tweak the sliders for brightness threshold, flicker speed, etc.

## Usage Tips

- A typical `brightness_threshold` around `0.3` works well for darker night images.
- Increase `flicker_speed` for a more rapid twinkle, or decrease it for a slow, gentle shimmer.
- Adjust `flicker_base` and `flicker_variation` to control how bright or dramatic the flicker is.

## Contributing

Please feel free to open pull requests or issues with suggestions, improvements, or bug reports.

## License

This project is licensed under the [MIT License](LICENSE).
