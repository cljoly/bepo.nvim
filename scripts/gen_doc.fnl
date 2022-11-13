;; bepo.nvim: bepo mapping for neovim
;; Copyright 2022 Clément Joly
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;

(local fennel (require :fennel))

; Requires a recent Lua version for UTF-8 support
(assert (> _VERSION "Lua 5.3"))
(local utf8 (require :utf8))

(fn ==== []
  (print (string.rep "=" 80)))

(fn ---- []
  (print (string.rep "-" 80)))

(fn right-align [str max]
  (let [len (utf8.len str)]
    (.. (string.rep " " (- max len)) str)))

(fn left-align [str max]
  (let [len (utf8.len str)]
    (.. str (string.rep " " (- max len)))))

(local mapping-struct-header {:bepo :Bepo :modes :Modes :qwerty :Qwerty})

(fn print-mapping-struct [struct]
  (match struct
    {: bepo : modes : qwerty} (let [qw (if (= ">" qwerty) "> " qwerty)]
                                (print (.. (right-align modes 6) "  "
                                           (left-align bepo 4) "  " qw)))
    _ (error (.. "Received an invalid struct" (fennel.view struct)))))

(fn print-lua-import [name]
  (->> (values (left-align (string.format "require(\"bepo\").%s()" name) 46)
               (.. :*bepo.nvim- name "*"))
       (string.format "%s %35s")
       (print)))

(set _G.gen-doc true)
(local bepo (require :fnl/bepo))

;; Content of the help file
(print "*bepo.nvim*       mappings for the bépo layout <https://bepo.fr>



Author:   Clément Joly <https://cj.rs/contact>
Homepage: <https://cj.rs/bepo-nvim>
License:  APACHE-2.0


                                      Type |gO| to see the table of contents.
")

(====)

(print "USAGE                                                            *bepo.nvim-usage*

For a basic setup with all mappings defined, just add the following to your
init.lua:
                                                                 *bepo.nvim-setup*

    require(\"bepo\").setup()

See |bepo.nvim-cherry-pick| to apply only some groups of mapping. By default,
setup() applies all mapping groups.
")

(print "                                                           *bepo.nvim-always-free*")

(print (fennel.metadata:get bepo.setup :fnl/docstring))
(print "")

(====)
(print "MAPPING CHERRY-PICK                                        *bepo.nvim-cherry-pick*

You can also pick only some groups of mapping, for instance because you have
your own preferences for some key that don’t match this extension. To apply
only the “window” and “movement” groups of mapping, use this instead of
|bepo.nvim-setup| in your init.lua:

    require(\"bepo\").movement()
    require(\"bepo\").window()

The following subsections go into details of exactly what mappings are
in each group. “Modes” have the same meaning as in the |map-table|.
")

(let [tbl (collect [name docstruct (pairs bepo)]
            (if (= name :setup) nil
                (= (type docstruct) :table) (values name docstruct)
                (error (.. "Invalid type for " name))))
      tbl_keys (icollect [name docstructy (pairs tbl)]
                name)]
  (do
    (table.sort tbl_keys)
    (each [_ name (pairs tbl_keys)]
      (do
        (local docstruct (. tbl name))
        (var need-header true)
        (fn print-header []
          (do
            (print-mapping-struct mapping-struct-header)
            (set need-header false)))

        (----)
        (print-lua-import name)
        (-?> docstruct (?. :docstring) print)
        (print "")
        (if (> (length docstruct.body) 0)
            (print-header))
        (each [i mapping-struct (pairs docstruct.body)]
          (if need-header (print-hedear))
          (match mapping-struct
            {:comment c} (do
                           (print (.. "\n" c))
                           (set need-header true))
            _ (print-mapping-struct mapping-struct)))
        (print "")))))

;; We split the vim and the : to prevent vim from picking up that for the fennel file
(print (.. "\nvim" ":tw=78:ts=8:ft=help:norl:"))

