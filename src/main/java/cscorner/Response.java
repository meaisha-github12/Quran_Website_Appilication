package cscorner;

import java.util.List;

public class Response {
    private List<ResultItem> result;

    public List<ResultItem> getResult() {
        return result;
    }

    public void setResult(List<ResultItem> result) {
        this.result = result;
    }

    public static class ResultItem {
        private String id;
        private String sura;
        private String aya;
        private String arabic_text;
        private String translation;
        private String footnotes;
        private String EnglishName;
        // Add the new field for Arabic name
        private String arabicName;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getSura() {
            return sura;
        }

        public void setSura(String sura) {
            this.sura = sura;
        }

        public String getAya() {
            return aya;
        }

        public void setAya(String aya) {
            this.aya = aya;
        }

        public String getArabic_text() {
            return arabic_text;
        }

        public void setArabic_text(String arabic_text) {
            this.arabic_text = arabic_text;
        }

        public String getTranslation() {
            return translation;
        }

        public void setTranslation(String translation) {
            this.translation = translation;
        }

        public String getFootnotes() {
            return footnotes;
        }

        public void setFootnotes(String footnotes) {
            this.footnotes = footnotes;
        }

        public String getEnglishName() {
            return EnglishName;
        }

        public void setEnglishName(String EnglishName) {
            this.EnglishName = EnglishName;
        }

        public String getArabicName() {
            return arabicName;
        }

        public void setArabicName(String arabicName) {
            this.arabicName = arabicName;
        }
    }
}
