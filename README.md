# Local Background Remover

A Streamlit app that removes image backgrounds with a local `rembg` model. Upload an image, draw a freehand outline around the subject directly on top of the image, and download the result as a PNG. Batch processing is also supported.

## Run locally

Use Python 3.12 for the pinned dependencies:

```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux: source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
streamlit run app.py
```

The model weights may download the first time you run background removal. Inference runs locally after the dependencies and model are available.

## Drawing on the image

The source image appears inside the drawing area. Use a mouse, trackpad, or finger on a touch screen to draw one continuous freehand loop around the subject. The app applies that selection after AI background removal. Untick **Apply my outline** if you want the AI result without the manual trim.

## Notes

- Supported uploads: PNG, JPG/JPEG, WebP.
- Maximum upload size: 25 MB; images over 40 megapixels are rejected for memory safety.
- `use_column_width=True` is intentionally used for compatibility with the pinned Streamlit 1.38 runtime.
