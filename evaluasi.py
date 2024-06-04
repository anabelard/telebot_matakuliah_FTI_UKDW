import pandas as pd
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

# Baca file CSV
df = pd.read_csv('input_results.csv')


true_labels = df['True Intent'].tolist()  # Label sebenarnya dari data pengujian
predicted_labels = df['Predicted Intent'].tolist()  # Prediksi model

# Hitung metrik-metrik kinerja
accuracy = accuracy_score(true_labels, predicted_labels)
precision = precision_score(true_labels, predicted_labels, average='weighted')
recall = recall_score(true_labels, predicted_labels, average='weighted')
f1 = f1_score(true_labels, predicted_labels, average='weighted')

# Tampilkan hasil
print("Accuracy:", accuracy)
print("Precision:", precision)
print("Recall:", recall)
print("F1-score:", f1)
