
sed -n '/<header>/,/<\/header>/p' index.html > .header
sed -n '/<footer>/,/<\/footer>/p' index.html > .footer

for i in */*.html; do
  sed -n  '0,/^<header/{//!p;}'  "$i" > tmp
  cat .header >> tmp
  sed -n '/<\/header>/,/<footer>/{//!p;}' "$i"  >> tmp
  cat .footer >> tmp
  sed -n '/<\/footer>/,${//!p;}' "$i"  >> tmp
  mv tmp "$i"
done

