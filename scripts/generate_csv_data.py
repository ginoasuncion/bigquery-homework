import pandas as pd
import numpy as np
import uuid

df = pd.DataFrame({
    "id": [str(uuid.uuid4()) for _ in range(1_000_000)],
    "group_id": [f"group_{i:04}" for i in np.random.randint(0, 1000, 1_000_000)],
    "value": np.random.rand(1_000_000) * 1000
})

df.to_csv("google_sheet_data.csv", index=False)
print("✅ Saved as google_sheet_data.csv")

