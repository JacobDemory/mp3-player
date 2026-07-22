# Third-Party Components

This project depends on two libraries stored in `lib/` so the original desktop
application can be built without a package manager:

| Component | Purpose | Included file |
|---|---|---|
| mp3agic | Reads MP3 metadata and embedded album art | `lib/mp3agic.jar` |
| JLayer 1.0.1 | Decodes and plays MP3 audio | `lib/jlayer-1.0.1.jar` |

The mp3agic archive includes its MIT license notice. JLayer is distributed by
the JavaZoom project; confirm and include the upstream license text before
publishing a downloadable binary release. These libraries were not authored by
Jacob Demory.

No music recordings or album covers are distributed with this repository.
Users select audio files they own through the application's file chooser.
