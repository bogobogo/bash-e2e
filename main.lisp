(defun save-file (filename txt)
  (with-open-file (out filename
                   :direction :output
                   :if-exists :supersede)
    (with-standard-io-syntax
      (print txt out))))

(defun load-file-content (file)
  (let ((result ""))
    (with-open-file (str file :direction :input)
      (do ((line (read-line str nil 'eof)
                 (read-line str nil 'eof)))
          ((eql line 'eof) result)
        (setf result (format nil "~a~%~a" result line))))))
   

(defun diff-2-files (gld-file-name test-file-name)
  (let ((gld-file (load-file-content gld-file-name))
        (test-file (load-file-content test-file-name)))
    (equal gld-file test-file)))

(diff-2-files "test.txt" "test.txt")    
  
