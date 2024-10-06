#!/bin/bash

# Parameter für Eingangs- und Ausgangsverzeichnis
input_dir="path/to/your/input_directory"  # Ersetzen Sie dies durch den Pfad Ihres Eingangsverzeichnisses
output_dir="path/to/your/output_directory"  # Ersetzen Sie dies durch den Pfad Ihres Ausgangsverzeichnisses

# Erstellen Sie das Ausgabeverzeichnis, falls es nicht existiert
mkdir -p "$output_dir"

# Durchlaufe alle Unterordner im Eingangsverzeichnis
for subfolder in "$input_dir"/*/; do
    # Den Namen des Unterordners extrahieren
    folder_name=$(basename "$subfolder")
    
    # Überprüfen, ob eine doc.pdf vorhanden ist
    if [[ -f "$subfolder/doc.pdf" ]]; then
        # Kopiere die doc.pdf in das Ausgabeverzeichnis
        cp "$subfolder/doc.pdf" "$output_dir/$folder_name.pdf"
        continue  # Wenn doc.pdf vorhanden ist, überspringe die nächsten Schritte
    fi

    # Überprüfung auf bearbeitete jpg Dateien
    edited_files=("$subfolder"/paper.*.edited.jpg)
    
    if [[ -e "${edited_files[0]}" ]]; then
        # Wenn bearbeitete JPG-Dateien vorhanden sind, verwende diese
        convert "${edited_files[@]}" "$output_dir/$folder_name.pdf"
    else
        # Andernfalls suche nach nicht bearbeiteten JPG-Dateien (papier.*.jpg, aber keine Thumbs)
        non_edited_files=("$subfolder"/paper.*.jpg)
        
        # Filtere die Thumb-Dateien heraus
        filtered_non_edited_files=()
        for file in "${non_edited_files[@]}"; do
            if [[ ! "$file" == *".thumb.jpg" ]]; then
                filtered_non_edited_files+=("$file")
            fi
        done

        # Überprüfen, ob gefilterte Dateien vorhanden sind
        if [[ ${#filtered_non_edited_files[@]} -gt 0 ]]; then
            convert "${filtered_non_edited_files[@]}" "$output_dir/$folder_name.pdf"
        fi
    fi
done
